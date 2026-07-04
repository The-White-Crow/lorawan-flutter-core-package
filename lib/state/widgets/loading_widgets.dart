import 'package:flutter/material.dart';

/// Full page loading widget
/// 
/// Displays a full-screen loading indicator
class FullPageLoadingWidget extends StatelessWidget {
  /// Optional loading message
  final String? message;

  /// Custom loading indicator
  final Widget? indicator;

  const FullPageLoadingWidget({
    super.key,
    this.message,
    this.indicator,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          indicator ?? const CircularProgressIndicator(),
          if (message != null) ...[
            const SizedBox(height: 16),
            Text(
              message!,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ],
      ),
    );
  }
}

/// Inline loading widget
/// 
/// Displays an inline loading indicator
class InlineLoadingWidget extends StatelessWidget {
  /// Custom loading indicator
  final Widget? indicator;

  /// Size of the loading indicator
  final double? size;

  const InlineLoadingWidget({
    super.key,
    this.indicator,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: indicator ??
            SizedBox(
              width: size ?? 24,
              height: size ?? 24,
              child: const CircularProgressIndicator(strokeWidth: 2),
            ),
      ),
    );
  }
}

/// Skeleton loading widget
/// 
/// Displays a skeleton loading placeholder
/// Note: This is a basic implementation. For advanced skeleton loading,
/// consider using the skeletonizer package
class SkeletonLoadingWidget extends StatelessWidget {
  /// The widget to show as skeleton
  final Widget child;

  /// Whether to show shimmer effect
  final bool showShimmer;

  const SkeletonLoadingWidget({
    super.key,
    required this.child,
    this.showShimmer = true,
  });

  @override
  Widget build(BuildContext context) {
    if (!showShimmer) {
      return Opacity(
        opacity: 0.3,
        child: child,
      );
    }

    // Basic shimmer effect
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.grey[300]!,
          Colors.grey[100]!,
          Colors.grey[300]!,
        ],
        stops: const [0.0, 0.5, 1.0],
      ).createShader(bounds),
      child: Opacity(
        opacity: 0.5,
        child: child,
      ),
    );
  }
}

