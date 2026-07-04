import 'package:flutter_core_package/flutter_core_package.dart';
import 'package:flutter/material.dart';

mixin RebuildMixin<T extends StatefulWidget> on State<T> {
  int _rebuilds = 0;

  @override
  Widget build(BuildContext context) {
    _rebuilds++;

    '${widget.runtimeType} rebuilt $_rebuilds times'.log(tag: 'RebuildMixin');
    return buildWithCount(context, _rebuilds);
  }

  Widget buildWithCount(BuildContext context, int count);
}

mixin RenderAwareMixin<T extends StatefulWidget> on State<T> {
  final renderKey = GlobalKey();

  Size? get widgetSize {
    final ctx = renderKey.currentContext;
    if (ctx == null) return null;
    final box = ctx.findRenderObject() as RenderBox?;
    return box?.size;
  }

  Offset? get widgetPosition {
    final ctx = renderKey.currentContext;
    if (ctx == null) return null;
    final box = ctx.findRenderObject() as RenderBox?;
    return box?.localToGlobal(Offset.zero);
  }
}

mixin DelayedInitMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => afterFirstLayout());
  }

  void afterFirstLayout();
}
