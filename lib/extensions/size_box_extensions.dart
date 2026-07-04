import 'package:flutter/material.dart';

extension SizeBoxExtension on double {
  Widget get heightBox => SizedBox(height: this);

  Widget get widthBox => SizedBox(width: this);
}

extension SizeBoxNumExtension on num {
  Widget get widthBox => SizedBox(width: double.tryParse(toString()));

  Widget get heightBox => SizedBox(height: double.tryParse(toString()));
}
