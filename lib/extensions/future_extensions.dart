import 'package:flutter_core_package/flutter_core_package.dart';

extension ExFuture<T> on Future<T> {
  Future<T> trackTime(String label) async {
    final start = DateTime.now();
    final result = await this;
    final end = DateTime.now();
    final duration = end.difference(start);
    '$label completed in ${duration.inMilliseconds} ms'.log(tag: 'Performance');
    return result;
  }
}

extension RetryFuture<T> on Future<T> {
  Future<T> retry({int retries = 3, Duration delay = const Duration(seconds: 1)}) async {
    assert(retries > 0, 'Retries must be greater than 0');
    late Object lastError;

    for (var attempt = 0; attempt < retries; attempt++) {
      try {
        return await this;
      } catch (e) {
        'Attempt ${attempt + 1} failed: $e'.log(tag: 'RetryFuture', level: LogLevel.warning);
        lastError = e;
        if (attempt < retries - 1) {
          await Future<void>.delayed(delay);
        }
      }
    }
    throw lastError;
  }
}
