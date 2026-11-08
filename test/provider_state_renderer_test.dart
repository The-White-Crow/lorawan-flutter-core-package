import 'package:flutter/material.dart';
import 'package:flutter_core_package/flutter_core_package.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class _StateController extends Notifier<ProviderState<String>> {
  @override
  ProviderState<String> build() => const ProviderState.init();

  ProviderState<String> get value => state;

  set value(ProviderState<String> value) => state = value;
}

final _provider = NotifierProvider<_StateController, ProviderState<String>>(
  _StateController.new,
);

const _failure = CustomFailure(
  error: 'Unavailable',
  type: FailureType.fullPage,
);

Future<ProviderContainer> _mount(
  WidgetTester tester, {
  ProviderState<String> initial = const ProviderState.init(),
  bool retain = false,
  bool selected = false,
  bool sliver = false,
  bool innerState = false,
  bool customLoading = true,
  String? fakeData = 'skeleton',
  String retryLabel = 'Retry',
  VoidCallback? onRetry,
  VoidCallback? onInit,
  void Function(Failure)? onPopUpError,
}) async {
  final container = ProviderContainer();
  addTearDown(container.dispose);
  container.read(_provider.notifier).value = initial;
  await tester.pumpWidget(
    UncontrolledProviderScope(
      container: container,
      child: MaterialApp(
        home: Scaffold(
          body: Consumer(
            builder: (context, ref, child) {
              final result = ref.buildWithProviderState<String, String?>(
                context: context,
                provider: _provider,
                select: selected ? (state) => state.data : null,
                onSuccess: (data, {isLoading = false}) =>
                    Text('$data:$isLoading'),
                onRetainedData: retain
                    ? (data, {required isLoading, required isStale, failure}) {
                        final text = Text(
                          '$data:$isLoading:$isStale:${failure?.error}',
                        );
                        return sliver ? SliverToBoxAdapter(child: text) : text;
                      }
                    : null,
                fakeData: fakeData,
                onLoading: customLoading
                    ? () => const Text('custom loading')
                    : null,
                onInit: onInit,
                retryLabel: retryLabel,
                onRetry: onRetry,
                innerState: innerState,
                sliver: sliver,
                onPopUpError: onPopUpError,
              );
              return sliver ? CustomScrollView(slivers: [result]) : result;
            },
          ),
        ),
      ),
    ),
  );
  return container;
}

void main() {
  testWidgets('legacy initial, loading, success and error remain unchanged', (
    tester,
  ) async {
    var initializations = 0;
    final container = await _mount(tester, onInit: () => initializations++);
    expect(initializations, 1);
    final controller = container.read(_provider.notifier)
      ..value = const ProviderState.loading('old');
    await tester.pump();
    expect(find.text('custom loading'), findsOneWidget);
    controller.value = const ProviderState.success('fresh');
    await tester.pump();
    expect(find.text('fresh:false'), findsOneWidget);
    controller.value = const ProviderState.error(_failure, data: 'old');
    await tester.pump();
    expect(find.byType(FullPageErrorWidget), findsOneWidget);
    expect(find.text('Retry'), findsOneWidget);
  });

  for (final selected in [false, true]) {
    testWidgets(
      'retained loading/error flags and recovery (select=$selected)',
      (tester) async {
        final container = await _mount(
          tester,
          retain: true,
          selected: selected,
        );
        final controller = container.read(_provider.notifier)
          ..value = const ProviderState.success('old');
        await tester.pump();
        controller.value = const ProviderState.loading('old');
        await tester.pump();
        expect(find.text('old:true:true:null'), findsOneWidget);
        expect(find.text('custom loading'), findsNothing);
        controller.value = const ProviderState.error(_failure, data: 'old');
        await tester.pump();
        expect(find.text('old:false:true:Unavailable'), findsOneWidget);
        expect(find.byType(FullPageErrorWidget), findsNothing);
        controller.value = const ProviderState.error(
          CustomFailure(error: 'Changed'),
          data: 'old',
        );
        await tester.pump();
        expect(find.text('old:false:true:Changed'), findsOneWidget);
        controller.value = const ProviderState.success('new');
        await tester.pump();
        expect(find.text('new:false'), findsOneWidget);
      },
    );
  }

  testWidgets('retention without data falls back to loading/error widgets', (
    tester,
  ) async {
    final container = await _mount(tester, retain: true);
    container.read(_provider.notifier).value = const ProviderState.loading();
    await tester.pump();
    expect(find.text('custom loading'), findsOneWidget);
    container.read(_provider.notifier).value = const ProviderState.error(
      _failure,
    );
    await tester.pump();
    expect(find.byType(FullPageErrorWidget), findsOneWidget);
  });

  for (final type in FailureType.values) {
    testWidgets('localized retry label and callback for $type', (tester) async {
      var retries = 0;
      await _mount(
        tester,
        initial: ProviderState.error(
          CustomFailure(error: 'Unavailable', type: type),
        ),
        retryLabel: 'تلاش دوباره',
        onRetry: () => retries++,
      );
      await tester.tap(find.text('تلاش دوباره'));
      expect(retries, 1);
      expect(find.text('Retry'), findsNothing);
    });
  }

  testWidgets('legacy skeleton and default loading are preserved', (
    tester,
  ) async {
    await _mount(
      tester,
      initial: const ProviderState.loading('old'),
      customLoading: false,
    );
    expect(find.byType(SkeletonLoadingWidget), findsOneWidget);
    expect(find.text('skeleton:true'), findsOneWidget);
    await _mount(
      tester,
      initial: const ProviderState.loading(),
      customLoading: false,
      fakeData: null,
    );
    expect(find.byType(FullPageLoadingWidget), findsOneWidget);
  });

  testWidgets('empty retained data is not treated as missing data', (
    tester,
  ) async {
    await _mount(
      tester,
      initial: const ProviderState.loading(''),
      retain: true,
    );
    expect(find.text(':true:true:null'), findsOneWidget);
  });

  testWidgets('mounting an existing popup failure does not emit it', (
    tester,
  ) async {
    final failures = <Failure>[];
    await _mount(
      tester,
      initial: const ProviderState.error(
        CustomFailure(error: 'Popup'),
        data: 'old',
      ),
      retain: true,
      onPopUpError: failures.add,
    );
    expect(failures, isEmpty);
    expect(find.text('old:false:true:Popup'), findsOneWidget);
  });

  testWidgets('compact retry has localized tooltip and still retries', (
    tester,
  ) async {
    var retries = 0;
    await _mount(
      tester,
      initial: const ProviderState.error(_failure),
      innerState: true,
      retryLabel: 'تلاش دوباره',
      onRetry: () => retries++,
    );
    expect(find.byTooltip('تلاش دوباره'), findsOneWidget);
    await tester.tap(find.byType(SmallErrorWidget));
    expect(retries, 1);
  });

  testWidgets('popup is emitted once per changed failure, never on rebuild', (
    tester,
  ) async {
    final failures = <Failure>[];
    final container = await _mount(
      tester,
      retain: true,
      selected: true,
      onPopUpError: failures.add,
    );
    final controller = container.read(_provider.notifier);
    const popup = CustomFailure(error: 'Popup');
    controller.value = const ProviderState.error(popup, data: 'old');
    await tester.pump();
    expect(failures, [popup]);
    controller.value = const ProviderState.error(popup, data: 'updated');
    await tester.pump();
    tester.element(find.byType(Consumer)).markNeedsBuild();
    await tester.pump();
    expect(failures, [popup]);
    controller.value = const ProviderState.loading('updated');
    await tester.pump();
    controller.value = const ProviderState.error(popup, data: 'updated');
    await tester.pump();
    expect(failures, [popup, popup]);
  });

  testWidgets('sliver retained builder owns its sliver layout', (tester) async {
    final container = await _mount(
      tester,
      retain: true,
      sliver: true,
      initial: const ProviderState.loading('old'),
    );
    expect(find.text('old:true:true:null'), findsOneWidget);
    container.read(_provider.notifier).value = const ProviderState.error(
      _failure,
      data: 'old',
    );
    await tester.pump();
    expect(find.text('old:false:true:Unavailable'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
