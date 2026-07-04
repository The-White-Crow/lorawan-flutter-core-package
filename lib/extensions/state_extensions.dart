import 'package:flutter/material.dart';

extension SafeSetState on State {
  void setStateSafe(VoidCallback fn) {
    // ignore: invalid_use_of_protected_member
    if (mounted) setState(fn);
  }
}
