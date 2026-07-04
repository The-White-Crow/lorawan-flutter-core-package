import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_core_package/state/provider_state.dart';
import 'package:flutter_core_package/state/pagination_state.dart';
import 'package:flutter_core_package/error/failure.dart';
import 'package:flutter_core_package/error/failure_type.dart';
import 'package:flutter_core_package/state/widgets/error_widgets.dart';
import 'package:flutter_core_package/state/widgets/loading_widgets.dart';
import 'package:flutter_riverpod/misc.dart';

/// Extension methods for WidgetRef to build widgets from provider states
extension ProviderStateUIX on WidgetRef {
  /// Build a widget with the provider state.
  ///
  /// This method handles different states (loading, error, success) and builds
  /// the appropriate widget. It also provides options for handling initial,
  /// loading, and error states.
  ///
  /// **Optimized rebuilds**: Uses `watch` for reactive updates and `listen` for
  /// side effects (like showing toasts) without triggering rebuilds.
  ///
  /// **Parameters:**
  /// - [context]: The BuildContext to use for building the widget.
  /// - [provider]: The provider that holds the state.
  /// - [onSuccess]: A callback function to build the widget when the state is successful.
  /// - [onRetry]: A callback function to handle retrying the operation on error.
  /// - [onInit]: A callback function to handle the initial state.
  /// - [onLoading]: A callback function to handle the loading state.
  /// - [fakeData]: Optional fake data to display while loading (for skeleton loading).
  /// - [sliver]: Whether to use a Sliver widget (requires skeletonizer package).
  /// - [innerState]: Whether to use the inner error state (SmallErrorWidget instead of FullPageErrorWidget).
  /// - [onPopUpError]: Optional callback for handling popUp errors (e.g., show toast).
  /// - [select]: Optional selector function for optimized rebuilds. Only rebuilds when the selected value changes.
  ///
  /// **Example:**
  /// ```dart
  /// // Basic usage
  /// ref.buildWithProviderState<String>(
  ///   context: context,
  ///   provider: myProvider,
  ///   onSuccess: (data, {isLoading}) => Text(data),
  ///   onRetry: () => ref.refresh(myProvider),
  ///   fakeData: 'Loading...',
  /// );
  ///
  /// // With select for optimized rebuilds
  /// ref.buildWithProviderState<AddressState, List<Address>>(
  ///   context: context,
  ///   provider: addressProvider,
  ///   select: (state) => state.data?.addresses, // Only rebuild when addresses change
  ///   onSuccess: (data, {isLoading}) => AddressList(addresses: data.addresses),
  /// );
  /// ```
  Widget buildWithProviderState<T, R>({
    required BuildContext context,
    required ProviderBase<ProviderState<T>> provider,
    required Widget Function(T data, {bool isLoading}) onSuccess,
    VoidCallback? onRetry,
    VoidCallback? onInit,
    Widget Function()? onLoading,
    T? fakeData,
    bool sliver = false,
    bool innerState = false,
    void Function(Failure failure)? onPopUpError,
    R Function(ProviderState<T>)? select,
  }) {
    // Use select for optimized rebuilds if provided
    // When select is used, we watch only the selected value
    // This minimizes rebuilds to only when the selected value changes
    if (select != null) {
      // Watch only the selected value for rebuild optimization
      watch(provider.select(select));
      // Also watch status to ensure we rebuild on error/loading state changes
      // This is necessary because error/loading states might change without data change
      watch(provider.select((state) => state.status));
    }

    // Get full state for error/loading/success handling
    // If select is used, we use read() to avoid extra rebuilds
    // (we already watched selected value and status above)
    // Otherwise use watch() for reactive updates
    final state = select != null ? read(provider) : watch(provider);

    // Listen for popUp errors without triggering rebuild
    // Always listen to failure changes regardless of select
    listen(provider.select((state) => state.failure), (previous, next) {
      final failure = next;
      if (failure != null && failure.type == FailureType.popUp) {
        onPopUpError?.call(failure);
      }
    });

    // Initial state
    if (state.isInit && state.data == null) {
      onInit?.call();
      return const SizedBox.shrink();
    }

    // Loading state with fake data
    if (state.isLoading || (state.isInit && state.data != null)) {
      if (onLoading != null) {
        return onLoading();
      }

      // Use fake data for skeleton loading if available
      if (fakeData != null) {
        if (sliver) {
          // Note: SliverSkeletonizer requires skeletonizer package
          // For now, we'll use a basic implementation
          return SliverToBoxAdapter(child: SkeletonLoadingWidget(child: onSuccess(fakeData, isLoading: true)));
        } else {
          return SkeletonLoadingWidget(child: onSuccess(fakeData, isLoading: true));
        }
      }

      // Default loading widget
      if (sliver) {
        return const SliverToBoxAdapter(child: FullPageLoadingWidget());
      } else {
        return const FullPageLoadingWidget();
      }
    }

    // Error handling
    if (state.hasError && state.failure != null) {
      final failure = state.failure!;

      // Handle inline errors
      if (failure.type == FailureType.inline) {
        return InlineErrorWidget(failure: failure, onRetry: onRetry ?? () => refresh(provider), showRetry: onRetry != null);
      }

      // Handle fullPage errors
      if (failure.type == FailureType.fullPage) {
        if (innerState) {
          return Center(
            child: SmallErrorWidget(title: failure.error, onClick: onRetry ?? () => refresh(provider)),
          );
        }
        return FullPageErrorWidget(failure: failure, onRetry: onRetry ?? () => refresh(provider));
      }

      // PopUp errors are handled by listener above
      // Fallback: show inline error
      return InlineErrorWidget(failure: failure, onRetry: onRetry ?? () => refresh(provider), showRetry: onRetry != null);
    }

    // Success state
    if (state.hasData && state.data != null) {
      return onSuccess(state.data as T, isLoading: false);
    }

    // Fallback
    return const SizedBox.shrink();
  }
}

/// Extension methods for WidgetRef to build widgets from AsyncValue
extension ProviderAsyncStateUIX on WidgetRef {
  /// Build a widget with AsyncValue state.
  ///
  /// This method handles AsyncValue states (loading, error, data) and builds
  /// the appropriate widget. It uses `when` method for optimized rebuilds.
  ///
  /// **Parameters:**
  /// - [context]: The BuildContext to use for building the widget.
  /// - [provider]: The provider that holds the AsyncValue state.
  /// - [onSuccess]: A callback function to build the widget when the state is successful.
  /// - [onRetry]: A callback function to handle retrying the operation on error.
  /// - [onLoading]: A callback function to handle the loading state.
  /// - [fakeData]: Optional fake data to display while loading (for skeleton loading).
  /// - [sliver]: Whether to use a Sliver widget.
  /// - [innerState]: Whether to use the inner error state.
  /// - [onPopUpError]: Optional callback for handling popUp errors.
  /// - [select]: Optional selector function for optimized rebuilds. Only rebuilds when the selected value changes.
  ///
  /// **Example:**
  /// ```dart
  /// // Basic usage
  /// ref.buildWithAsyncValue<String>(
  ///   context: context,
  ///   provider: myFutureProvider,
  ///   onSuccess: (data) => Text(data),
  ///   onRetry: () => ref.refresh(myFutureProvider),
  /// );
  ///
  /// // With select for optimized rebuilds
  /// ref.buildWithAsyncValue<User, String>(
  ///   context: context,
  ///   provider: userProvider,
  ///   select: (asyncValue) => asyncValue.value?.name, // Only rebuild when name changes
  ///   onSuccess: (user) => Text(user.name),
  /// );
  /// ```
  Widget buildWithAsyncValue<T, R>({
    required BuildContext context,
    required ProviderBase<AsyncValue<T>> provider,
    required Widget Function(T data) onSuccess,
    VoidCallback? onRetry,
    Widget Function()? onLoading,
    T? fakeData,
    bool sliver = false,
    bool innerState = false,
    void Function(Failure failure)? onPopUpError,
    R Function(AsyncValue<T>)? select,
  }) {
    // Use select for optimized rebuilds if provided
    // When select is used, we watch only the selected value
    // This minimizes rebuilds to only when the selected value changes
    if (select != null) {
      // Watch only the selected value for rebuild optimization
      watch(provider.select(select));
      // Also watch the AsyncValue state to ensure we rebuild on error/loading changes
      // This is necessary because error/loading states might change without data change
      watch(provider.select((value) => (value.isLoading, value.hasError, value.hasValue)));
    }

    // Get full state for error/loading/success handling
    // If select is used, we use read() to avoid extra rebuilds
    // (we already watched selected value and state above)
    // Otherwise use watch() for reactive updates
    final state = select != null ? read(provider) : watch(provider);

    // Listen for popUp errors without triggering rebuild
    // Always listen to error changes regardless of select
    listen(provider.select((value) => value.error), (previous, next) {
      if (next is Failure) {
        final failure = next;
        if (failure.type == FailureType.popUp) {
          onPopUpError?.call(failure);
        }
      }
    });

    // If select is used, we need to check if the selected value changed
    // and only rebuild when it actually changes
    // For now, we'll use when() which handles the state properly
    // The select optimization happens at the watch level
    return state.when(
      data: (data) => onSuccess(data),
      error: (error, stackTrace) {
        // Convert error to Failure if needed
        final failure = error is Failure
            ? error
            : CustomFailure(
                error: 'An error occurred',
                message: error.toString(),
                errorCode: stackTrace.toString(),
                type: FailureType.fullPage,
              );

        // Handle inline errors
        if (failure.type == FailureType.inline) {
          return InlineErrorWidget(failure: failure, onRetry: onRetry ?? () => refresh(provider), showRetry: onRetry != null);
        }

        // Handle fullPage errors
        if (failure.type == FailureType.fullPage) {
          if (innerState) {
            return Center(
              child: SmallErrorWidget(title: failure.error, onClick: onRetry ?? () => refresh(provider)),
            );
          }
          return FullPageErrorWidget(failure: failure, onRetry: onRetry ?? () => refresh(provider));
        }

        // PopUp errors are handled by listener above
        // Fallback: show full page error
        return FullPageErrorWidget(failure: failure, onRetry: onRetry ?? () => refresh(provider));
      },
      loading: () {
        if (onLoading != null) {
          return onLoading();
        }

        // Use fake data for skeleton loading if available
        if (fakeData != null) {
          if (sliver) {
            return SliverToBoxAdapter(child: SkeletonLoadingWidget(child: onSuccess(fakeData)));
          } else {
            return SkeletonLoadingWidget(child: onSuccess(fakeData));
          }
        }

        // Default loading widget
        if (sliver) {
          return const SliverToBoxAdapter(child: FullPageLoadingWidget());
        } else {
          return const FullPageLoadingWidget();
        }
      },
    );
  }
}

/// Extension methods for WidgetRef to build widgets from pagination states
extension PaginationStateUIX on WidgetRef {
  /// Build a widget with pagination state.
  ///
  /// This method handles all pagination states (init, loading, success, loadingNext, error, errorOnNext)
  /// and builds the appropriate widget. It provides options for handling initial load,
  /// loading next page, errors, and success states.
  ///
  /// **Optimized rebuilds**: Uses `watch` for reactive updates and `listen` for
  /// side effects (like showing toasts) without triggering rebuilds.
  ///
  /// **Parameters:**
  /// - [context]: The BuildContext to use for building the widget.
  /// - [provider]: The provider that holds the pagination state.
  /// - [onSuccess]: A callback function to build the widget when items are loaded.
  ///   Receives: items list, hasMore flag, isLoadingNext flag
  /// - [onRetry]: A callback function to handle retrying the initial load on error.
  /// - [onLoadMoreRetry]: A callback function to handle retrying loading next page on error.
  /// - [onInit]: A callback function to handle the initial state.
  /// - [onLoading]: A callback function to handle the initial loading state.
  /// - [onLoadingNext]: A callback function to handle loading next page (shows at bottom of list).
  /// - [fakeData]: Optional fake data list to display while loading (for skeleton loading).
  /// - [sliver]: Whether to use Sliver widgets (for CustomScrollView).
  /// - [innerState]: Whether to use the inner error state (SmallErrorWidget instead of FullPageErrorWidget).
  /// - [onPopUpError]: Optional callback for handling popUp errors (e.g., show toast).
  /// - [select]: Optional selector function for optimized rebuilds. Only rebuilds when the selected value changes.
  ///
  /// **Example:**
  /// ```dart
  /// // Basic usage
  /// ref.buildWithPaginationState<Item>(
  ///   context: context,
  ///   provider: itemsProvider,
  ///   onSuccess: (items, hasMore, isLoadingNext) => ListView.builder(
  ///     itemCount: items.length + (hasMore ? 1 : 0),
  ///     itemBuilder: (context, index) {
  ///       if (index == items.length) {
  ///         return LoadMoreButton(
  ///           onLoadMore: () => ref.read(itemsProvider.notifier).loadNext(),
  ///           isLoading: isLoadingNext,
  ///         );
  ///       }
  ///       return ItemWidget(item: items[index]);
  ///     },
  ///   ),
  ///   onRetry: () => ref.read(itemsProvider.notifier).retry(),
  ///   onLoadMoreRetry: () => ref.read(itemsProvider.notifier).retryLoadNext(),
  /// );
  /// ```
  Widget buildWithPaginationState<T, R>({
    required BuildContext context,
    required ProviderBase<PaginationState<T>> provider,
    required Widget Function(List<T> items, bool hasMore, bool isLoadingNext) onSuccess,
    VoidCallback? onRetry,
    VoidCallback? onLoadMoreRetry,
    VoidCallback? onInit,
    Widget Function()? onLoading,
    Widget Function()? onLoadingNext,
    List<T>? fakeData,
    bool sliver = false,
    bool innerState = false,
    void Function(Failure failure)? onPopUpError,
    R Function(PaginationState<T>)? select,
  }) {
    // Use select for optimized rebuilds if provided
    if (select != null) {
      // Watch only the selected value for rebuild optimization
      watch(provider.select(select));
      // Also watch state type to ensure we rebuild on state changes
      watch(
        provider.select(
          (state) => (state.isInit, state.isLoading, state.isSuccess, state.isLoadingNext, state.isError, state.isErrorOnNext),
        ),
      );
    }

    // Get full state for error/loading/success handling
    final state = select != null ? read(provider) : watch(provider);

    // Listen for popUp errors without triggering rebuild
    listen(provider.select((state) => state.getFailure()), (previous, next) {
      final failure = next;
      if (failure != null && failure.type == FailureType.popUp) {
        onPopUpError?.call(failure);
      }
    });

    // Initial state
    if (state.isInit) {
      onInit?.call();
      return const SizedBox.shrink();
    }

    // Initial loading state
    if (state.isLoading) {
      if (onLoading != null) {
        return onLoading();
      }

      // Use fake data for skeleton loading if available
      if (fakeData != null && fakeData.isNotEmpty) {
        if (sliver) {
          return SliverToBoxAdapter(child: SkeletonLoadingWidget(child: onSuccess(fakeData, false, false)));
        } else {
          return SkeletonLoadingWidget(child: onSuccess(fakeData, false, false));
        }
      }

      // Default loading widget
      if (sliver) {
        return const SliverToBoxAdapter(child: FullPageLoadingWidget());
      } else {
        return const FullPageLoadingWidget();
      }
    }

    // Error handling - initial error
    if (state.isError) {
      final failure = state.getFailure()!;

      // Handle inline errors
      if (failure.type == FailureType.inline) {
        return InlineErrorWidget(failure: failure, onRetry: onRetry ?? () => refresh(provider), showRetry: onRetry != null);
      }

      // Handle fullPage errors
      if (failure.type == FailureType.fullPage) {
        if (innerState) {
          return Center(
            child: SmallErrorWidget(title: failure.error, onClick: onRetry ?? () => refresh(provider)),
          );
        }
        return FullPageErrorWidget(failure: failure, onRetry: onRetry ?? () => refresh(provider));
      }

      // PopUp errors are handled by listener above
      // Fallback: show inline error
      return InlineErrorWidget(failure: failure, onRetry: onRetry ?? () => refresh(provider), showRetry: onRetry != null);
    }

    // Success state or states with items (loadingNext, errorOnNext)
    final items = state.getItems();
    final hasMore = state.hasMoreItems();

    // Error on next page - show items with error indicator
    if (state.isErrorOnNext) {
      final failure = state.getFailure()!;

      // Build success widget with items
      final successWidget = onSuccess(items, hasMore, false);

      // Add error indicator for next page error
      if (sliver) {
        return SliverList(
          delegate: SliverChildListDelegate([
            successWidget,
            InlineErrorWidget(
              failure: failure,
              onRetry: onLoadMoreRetry ?? () => refresh(provider),
              showRetry: onLoadMoreRetry != null,
            ),
          ]),
        );
      } else {
        return Column(
          children: [
            Expanded(child: successWidget),
            InlineErrorWidget(
              failure: failure,
              onRetry: onLoadMoreRetry ?? () => refresh(provider),
              showRetry: onLoadMoreRetry != null,
            ),
          ],
        );
      }
    }

    // Loading next page - show items with loading indicator
    if (state.isLoadingNext) {
      final successWidget = onSuccess(items, hasMore, true);

      // Add loading indicator for next page
      if (onLoadingNext != null) {
        if (sliver) {
          return SliverList(delegate: SliverChildListDelegate([successWidget, onLoadingNext()]));
        } else {
          return Column(
            children: [
              Expanded(child: successWidget),
              onLoadingNext(),
            ],
          );
        }
      }

      // Default loading next indicator
      if (sliver) {
        return SliverList(
          delegate: SliverChildListDelegate([successWidget, const SliverToBoxAdapter(child: InlineLoadingWidget())]),
        );
      } else {
        return Column(
          children: [
            Expanded(child: successWidget),
            const InlineLoadingWidget(),
          ],
        );
      }
    }

    // Success state
    if (state.isSuccess) {
      return onSuccess(items, hasMore, false);
    }

    // Fallback
    return const SizedBox.shrink();
  }
}
