import 'package:flutter/material.dart';
import 'package:flutter_core_package/error/failure.dart';

/// Full page error widget
///
/// Displays a full-screen error message with retry functionality
class FullPageErrorWidget extends StatelessWidget {
  /// The failure that occurred
  final Failure failure;

  /// Callback when retry is pressed
  final VoidCallback? onRetry;

  /// Optional custom error message
  final String? customMessage;

  /// Optional custom title
  final String? customTitle;

  const FullPageErrorWidget({super.key, required this.failure, this.onRetry, this.customMessage, this.customTitle});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: Theme.of(context).colorScheme.error),
            const SizedBox(height: 16),
            Text(customTitle ?? failure.error, style: Theme.of(context).textTheme.headlineSmall, textAlign: TextAlign.center),
            if (failure.message != null || customMessage != null) ...[
              const SizedBox(height: 8),
              Text(
                customMessage ?? failure.message ?? '',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              ElevatedButton.icon(onPressed: onRetry, icon: const Icon(Icons.refresh), label: const Text('Retry')),
            ],
          ],
        ),
      ),
    );
  }
}

/// Inline error widget
///
/// Displays an inline error message (e.g., in a form field or list item)
class InlineErrorWidget extends StatelessWidget {
  /// The failure that occurred
  final Failure? failure;

  /// Custom error message
  final String? message;

  /// Callback when retry is pressed
  final VoidCallback? onRetry;

  /// Whether to show retry button
  final bool showRetry;

  const InlineErrorWidget({super.key, this.failure, this.message, this.onRetry, this.showRetry = false});

  @override
  Widget build(BuildContext context) {
    final errorMessage = message ?? failure?.error ?? 'An error occurred';

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(Icons.error_outline, color: Theme.of(context).colorScheme.error, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  errorMessage,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.error),
                ),
              ),
            ],
          ),
          if (showRetry && onRetry != null) ...[
            const SizedBox(height: 8),
            TextButton(onPressed: onRetry, child: const Text('Retry')),
          ],
        ],
      ),
    );
  }
}

/// Small error widget
///
/// Displays a compact error message (e.g., in a list item or card)
class SmallErrorWidget extends StatelessWidget {
  /// Error title/message
  final String? title;

  /// Callback when clicked
  final VoidCallback? onClick;

  /// Whether to show icon
  final bool showIcon;

  const SmallErrorWidget({super.key, this.title, this.onClick, this.showIcon = true});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showIcon) ...[
              Icon(Icons.error_outline, size: 16, color: Theme.of(context).colorScheme.error),
              const SizedBox(width: 8),
            ],
            Flexible(
              child: Text(
                title ?? 'Error loading data',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.error),
              ),
            ),
            if (onClick != null) ...[
              const SizedBox(width: 8),
              Icon(Icons.refresh, size: 16, color: Theme.of(context).colorScheme.primary),
            ],
          ],
        ),
      ),
    );
  }
}
