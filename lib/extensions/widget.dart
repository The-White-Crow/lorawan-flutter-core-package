import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget get toSliver {
    return SliverToBoxAdapter(child: this);
  }

  Widget onTap(VoidCallback? onTap) => GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: this,
      );

  Widget onDoubleTap(Function() function) => GestureDetector(onDoubleTap: function, child: this);

  Widget onLongPress(Function() function) => GestureDetector(onLongPress: function, child: this);

  Widget withVisibility({required bool visible}) {
    return visible ? this : SizedBox.shrink();
  }
}
