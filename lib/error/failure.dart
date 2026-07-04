import 'package:equatable/equatable.dart';
import 'package:flutter_core_package/error/failure_type.dart';

/// Base abstract class for all failures in the application
///
/// All failure classes should extend this class to maintain consistency
abstract class Failure extends Equatable {
  const Failure({
    required this.error,
    this.tag = FailureTag.unexpected,
    this.message,
    this.errorCode,
    this.type = FailureType.fullPage,
  });

  /// The error message/title
  final String error;

  /// Optional detailed message
  final String? message;

  /// Optional error code
  final String? errorCode;

  /// Category tag for the failure
  final FailureTag tag;

  /// How the error should be displayed
  final FailureType type;

  @override
  List<Object?> get props => [tag, message, error, type, errorCode];

  @override
  String toString() => 'Failure: $tag, $message, $error, $type, $errorCode';
}

/// Network-related failure (no internet, timeout, etc.)
class NetworkFailure extends Failure {
  const NetworkFailure({
    super.error = 'Network Error',
    super.message = 'Please check your internet connection and try again.',
    super.tag = FailureTag.network,
    super.errorCode,
    super.type = FailureType.fullPage,
  });
}

/// Server-related failure (5xx errors, server unavailable, etc.)
class ServerFailure extends Failure {
  const ServerFailure({
    super.error = 'Server Error',
    super.message = 'Unable to connect to server. Please try again later.',
    super.tag = FailureTag.server,
    super.errorCode,
    super.type = FailureType.fullPage,
  });
}

/// Cache-related failure (offline mode, cache miss, etc.)
class CacheFailure extends Failure {
  const CacheFailure({
    super.error = 'Cache Error',
    super.message = 'Offline mode is not available. Please connect to the internet.',
    super.tag = FailureTag.cache,
    super.errorCode,
    super.type = FailureType.fullPage,
  });
}

/// Custom failure for application-specific errors
class CustomFailure extends Failure {
  const CustomFailure({
    required super.error,
    super.tag = FailureTag.custom,
    super.message,
    super.errorCode,
    super.type = FailureType.popUp,
  });
}

/// Unexpected/unknown failure
class UnexpectedFailure extends Failure {
  const UnexpectedFailure({
    required super.tag,
    required super.error,
    super.message,
    super.errorCode,
    super.type = FailureType.fullPage,
  });
}
