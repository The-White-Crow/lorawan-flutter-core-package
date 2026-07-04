import 'package:flutter_core_package/error/failure.dart';

/// Status enum for ProviderState
enum ProviderStatus {
  /// Initial state - no data loaded yet
  init,

  /// Loading state - data is being fetched
  loading,

  /// Success state - data loaded successfully
  success,

  /// Error state - an error occurred
  error,
}

/// Generic state class for managing provider states
///
/// This class represents the state of an async operation with four possible states:
/// - init: Initial state before any operation
/// - loading: Operation in progress (can optionally hold previous data)
/// - success: Operation completed successfully with data
/// - error: Operation failed with a Failure
class ProviderState<T> {
  const ProviderState._({required this.status, this.data, this.failure});

  /// Initial state - no data loaded yet
  const ProviderState.init() : this._(status: ProviderStatus.init);

  /// Loading state - data is being fetched
  ///
  /// [data] is optional and can be used to show previous data while loading
  /// (useful for skeleton loading or showing stale data)
  const ProviderState.loading([T? data]) : this._(status: ProviderStatus.loading, data: data);

  /// Success state - data loaded successfully
  const ProviderState.success(T data) : this._(status: ProviderStatus.success, data: data);

  /// Error state - an error occurred
  ///
  /// [failure] is the failure that occurred
  /// [data] is optional and can be used to show previous data even on error
  const ProviderState.error(Failure failure, {T? data}) : this._(status: ProviderStatus.error, data: data, failure: failure);

  /// Current status
  final ProviderStatus status;

  /// Current data (if available)
  final T? data;

  /// Current failure (if error occurred)
  final Failure? failure;

  /// Check if state is initial
  bool get isInit => status == ProviderStatus.init;

  /// Check if state is loading
  bool get isLoading => status == ProviderStatus.loading;

  /// Check if state has data (success)
  bool get hasData => status == ProviderStatus.success;

  /// Check if state has error
  bool get hasError => status == ProviderStatus.error;

  /// Get data or null
  T? get valueOrNull => data;

  /// Get data (throws if null)
  T get value => data!;

  @override
  String toString() => 'ProviderState<$T>(status: $status, data: $data, failure: $failure)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProviderState<T> &&
          runtimeType == other.runtimeType &&
          status == other.status &&
          data == other.data &&
          failure == other.failure;

  @override
  int get hashCode => status.hashCode ^ data.hashCode ^ failure.hashCode;
}
