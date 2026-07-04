sealed class IAnalyticsEvent {
  const IAnalyticsEvent();

  String get name;

  Map<String, Object>? get parameters;
}

class CustomEvent extends IAnalyticsEvent {
  const CustomEvent({
    required this.eventName,
    this.eventParameters,
  });

  final String eventName;
  final Map<String, Object>? eventParameters;
  @override
  String get name => eventName;

  @override
  Map<String, Object>? get parameters => eventParameters;
}
