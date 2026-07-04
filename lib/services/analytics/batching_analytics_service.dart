import 'dart:async';

import 'package:flutter_core_package/log/log.dart';
import 'package:flutter_core_package/services/analytics/event/i_analytics_event.dart';
import 'package:flutter_core_package/services/analytics/i_analytics_service.dart';

class BatchingAnalyticsService extends IAnalyticsService {
  BatchingAnalyticsService(this.userId, this._services, {this.batchInterval = const Duration(seconds: 10), this.batchSize = 10}) {
    _startTimer();
  }

  final List<IAnalyticsService> _services;
  final List<IAnalyticsEvent> _eventQueue = [];
  final Duration batchInterval;
  final int batchSize;
  final String userId;

  Timer? _timer;

  void _startTimer() {
    'Starting timer for batching analytics events every $batchInterval seconds'.log(level: LogLevel.info);
    _timer = Timer.periodic(batchInterval, (_) => _flush());
  }

  Future<void> _flush() async {
    if (_eventQueue.isEmpty) return;

    final batch = List<IAnalyticsEvent>.from(_eventQueue);

    _eventQueue.clear();

    'Flushing batch of ${batch.length} events to services.'.log(tag: 'BatchingAnalyticsService', level: LogLevel.info);

    final userIdMap = {'user_id': userId};

    for (final service in _services) {
      try {
        for (final event in batch) {
          event.parameters?.addEntries(userIdMap.entries);
          await service.sendEvent(event);
        }
      } catch (e) {
        'Error sending events from service: ${service.runtimeType}'.log(tag: 'BatchingAnalyticsService', level: LogLevel.error);
        'Error sending batch events: $e'.log(
          tag: 'BatchingAnalyticsService',
          level: LogLevel.error,
          stackTrace: StackTrace.current,
        );
      }
    }
  }

  @override
  Future<void> sendEvent(IAnalyticsEvent event) async {
    _eventQueue.add(event);

    if (_eventQueue.length >= batchSize) {
      await _flush();
    }
  }

  @override
  Future<void> sendCustomEvent({required String name, Map<String, Object>? parameters}) async {
    _eventQueue.add(CustomEvent(eventName: name, eventParameters: parameters));

    if (_eventQueue.length >= batchSize) {
      await _flush();
    }
  }

  void dispose() {
    _timer?.cancel();
    _flush();
  }
}
