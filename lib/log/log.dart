import 'dart:io';

import 'package:flutter/foundation.dart';

enum LogLevel {
  verbose('🔍', '\x1B[34m', 0), // Blue
  trace('🔸', '\x1B[90m', 1), // Grey
  debug('💬', '\x1B[37m', 2), // White
  info('ℹ️', '\x1B[36m', 3), // Cyan
  warning('⚠️', '\x1B[33m', 4), // Yellow
  error('❌', '\x1B[31m', 5); // Red

  const LogLevel(this.emoji, this.colorCode, this.severity);

  final String emoji;
  final String colorCode;
  final int severity;
}

extension LogExtension on Object {
  void log({
    String tag = 'APP',
    LogLevel level = LogLevel.debug,
    bool enableColors = true,
    bool showCallerInfo = false,
    StackTrace? stackTrace,
  }) {
    // Skip level 0-2 in release mode
    if (level.severity <= 2 && !kDebugMode) return;

    final now = DateTime.now().toIso8601String();

    final color = (enableColors && _supportsAnsiColors) ? level.colorCode : '';
    final reset = (enableColors && _supportsAnsiColors) ? '\x1B[0m' : '';

    final callerInfo = showCallerInfo ? _getCallerInfo() : '';
    final callerSection = callerInfo.isNotEmpty ? ' $callerInfo' : '';

    final message = '${level.emoji} [$tag:$callerSection] $now $this';
    debugPrint('$color$message$reset');

    if (stackTrace != null) {
      debugPrint('$color📌 StackTrace:\n$stackTrace$reset');
    }
  }

  bool get _supportsAnsiColors {
    if (kIsWeb) return false;
    return !Platform.isWindows || stdout.supportsAnsiEscapes;
  }

  String _getCallerInfo() {
    try {
      final line = StackTrace.current.toString().split('\n')[2].trim();
      final match = RegExp(r'\((.+?):(\d+):\d+\)$').firstMatch(line);
      if (match != null) {
        final file = _extractFileName(match.group(1));
        final lineNum = match.group(2) ?? '0';
        return '$file:$lineNum';
      }
    } catch (_) {}
    return '';
  }

  String _extractFileName(String? path) {
    if (path == null || path.isEmpty) return 'unknown';
    return path.split(RegExp(r'[\\/]')).last;
  }
}
