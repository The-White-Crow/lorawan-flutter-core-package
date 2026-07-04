import 'package:flutter_core_package/error/failure.dart';

/// Sealed class for pagination state management
///
/// Represents all possible states of a paginated list:
/// - [init]: Initial state before any data is loaded
/// - [loading]: Loading the first page
/// - [success]: Successfully loaded items with pagination info
/// - [loadingNext]: Loading the next page (has previous items)
/// - [error]: Error loading the first page
/// - [errorOnNext]: Error loading the next page (has previous items)
///
/// Example:
/// ```dart
/// final state = PaginationState.success(items: [1, 2, 3], hasMore: true);
/// if (state.hasItems) {
///   print('Items: ${state.getItems()}');
/// }
/// ```
sealed class PaginationState<T> {
  const PaginationState();

  /// Initial state - no data loaded yet
  factory PaginationState.init() = _PaginationInit<T>;

  /// Loading state - fetching the first page
  factory PaginationState.loading() = _PaginationLoading<T>;

  /// Success state - items loaded successfully
  ///
  /// [items] is the list of loaded items
  /// [hasMore] indicates if there are more items to load (defaults to true)
  factory PaginationState.success(List<T> items, {bool? hasMore}) = _PaginationSuccess<T>;

  /// Loading next page - fetching additional items
  ///
  /// [oldItems] are the items already loaded
  factory PaginationState.loadingNext(List<T> oldItems) = _PaginationLoadingNext<T>;

  /// Error state - error loading the first page
  ///
  /// [failure] is the failure that occurred
  factory PaginationState.error(Failure failure) = _PaginationError<T>;

  /// Error on next page - error loading additional items
  ///
  /// [failure] is the failure that occurred
  /// [oldItems] are the items already loaded
  factory PaginationState.errorOnNext(Failure failure, List<T> oldItems) = _PaginationErrorOnNext<T>;

  /// Get current items (empty list if no items)
  List<T> getItems() {
    return switch (this) {
      _PaginationSuccess(items: final items) => items,
      _PaginationLoadingNext(oldItems: final items) => items,
      _PaginationErrorOnNext(oldItems: final items) => items,
      _ => <T>[],
    };
  }

  /// Check if state has items
  bool get hasItems => getItems().isNotEmpty;

  /// Check if there are more items to load
  bool hasMoreItems() {
    return switch (this) {
      _PaginationSuccess(hasMore: final hasMore) => hasMore,
      _PaginationLoadingNext() => true, // Assume more if loading next
      _PaginationErrorOnNext() => true, // Assume more if error on next
      _ => false,
    };
  }

  /// Check if currently loading (initial load)
  bool get isLoading => this is _PaginationLoading;

  /// Check if currently loading next page
  bool get isLoadingNext => this is _PaginationLoadingNext;

  /// Check if any loading is in progress
  bool get isLoadingAny => isLoading || isLoadingNext;

  /// Check if state is error (initial error)
  bool get isError => this is _PaginationError;

  /// Check if error occurred on next page
  bool get isErrorOnNext => this is _PaginationErrorOnNext;

  /// Check if any error occurred
  bool get isErrorAny => isError || isErrorOnNext;

  /// Get failure if error occurred
  Failure? getFailure() {
    return switch (this) {
      _PaginationError(failure: final failure) => failure,
      _PaginationErrorOnNext(failure: final failure) => failure,
      _ => null,
    };
  }

  /// Check if state is initial
  bool get isInit => this is _PaginationInit;

  /// Check if state is success
  bool get isSuccess => this is _PaginationSuccess;

  /// Get items count
  int get itemsCount => getItems().length;
}

/// Initial state - no data loaded yet
class _PaginationInit<T> extends PaginationState<T> {
  const _PaginationInit();
}

/// Loading state - fetching the first page
class _PaginationLoading<T> extends PaginationState<T> {
  const _PaginationLoading();
}

/// Success state - items loaded successfully
class _PaginationSuccess<T> extends PaginationState<T> {
  const _PaginationSuccess(this.items, {bool? hasMore}) : hasMore = hasMore ?? true;

  final List<T> items;
  final bool hasMore;
}

/// Loading next page - fetching additional items
class _PaginationLoadingNext<T> extends PaginationState<T> {
  const _PaginationLoadingNext(this.oldItems);

  final List<T> oldItems;
}

/// Error state - error loading the first page
class _PaginationError<T> extends PaginationState<T> {
  const _PaginationError(this.failure);

  final Failure failure;
}

/// Error on next page - error loading additional items
class _PaginationErrorOnNext<T> extends PaginationState<T> {
  const _PaginationErrorOnNext(this.failure, this.oldItems);

  final Failure failure;
  final List<T> oldItems;
}
