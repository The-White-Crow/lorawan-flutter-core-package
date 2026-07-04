import 'package:flutter_core_package/services/analytics/event/i_analytics_event.dart';

abstract class IAnalyticsService {
  Future<void> sendEvent(IAnalyticsEvent event);

  Future<void> sendCustomEvent({required String name, Map<String, Object>? parameters});
}
