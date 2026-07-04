import 'dart:async';

import 'package:flutter/material.dart';

class Debouncer {
  Timer? _debounce;
  void run(VoidCallback action, {Duration duration = const Duration(milliseconds: 500)}) {
    _debounce?.cancel();
    _debounce = Timer(duration, action);
  }

  void cancel() {
    _debounce?.cancel();
  }
}
