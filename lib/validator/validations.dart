import 'package:flutter/widgets.dart';

/// base class for all validations.
abstract class Validation<T> {
  const Validation();

  /// Validates the given [value] and returns an error message if
  /// validation fails.
  ///
  /// if the validation passes, it should return `null`.
  String? validate(BuildContext context, T? value);
}

/// a validation that checks if the value is required.
class RequiredValidation<T> extends Validation<T> {
  const RequiredValidation({this.isExist, this.msg});

  final bool Function(T value)? isExist;
  final String? msg;

  @override
  String? validate(BuildContext context, T? value) {
    if (value == null) {
      return msg ?? 'This field is required';
    }

    if (isExist != null && !isExist!(value)) {
      return msg ?? 'This field is required';
    }

    if (value is String && (value as String).isEmpty) {
      return msg ?? 'This field is required';
    }
    return null;
  }
}

/// a validation that checks if the value is a valid email.
class EmailValidation extends Validation<String> {
  const EmailValidation({this.msg});

  final String? msg;

  @override
  String? validate(BuildContext context, String? value) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (value == null) return null;
    if (!emailRegex.hasMatch(value)) {
      return msg ?? 'This field is not a valid email';
    }
    return null;
  }
}

class PersianPhoneNumberValidation extends Validation<String> {
  const PersianPhoneNumberValidation({this.msg});

  final String? msg;

  @override
  String? validate(BuildContext context, String? value) {
    final phoneRegex = RegExp(r'^09\d{9}$');

    if (value == null) return null;
    if (!phoneRegex.hasMatch(value)) {
      return msg ?? 'This field is not a valid Persian phone number';
    }
    return null;
  }
}

/// a validation that checks if the value length is more that a value
class MinLengthValidation extends Validation<String> {
  const MinLengthValidation(this.minLength, {this.msg});

  final int minLength;
  final String? msg;

  @override
  String? validate(BuildContext context, String? value) {
    if (value == null) return null;

    if (value.length < minLength) {
      return msg ?? 'This field is too short';
    }

    return null;
  }
}

/// a validation that checks if the value length is less than a value
class MaxLengthValidation extends Validation<String> {
  const MaxLengthValidation(this.maxLength, {this.msg});

  final int maxLength;
  final String? msg;

  @override
  String? validate(BuildContext context, String? value) {
    if (value == null) return null;

    if (value.length > maxLength) {
      return msg ?? 'This field is too long';
    }

    return null;
  }
}

class NumberValidation extends Validation<String> {
  const NumberValidation({this.max = 1000000, this.min = 0, this.msg, this.msgOutOfRange});
  final int max;
  final int min;
  final String? msg;
  final String? msgOutOfRange;

  @override
  String? validate(BuildContext context, String? value) {
    if (value == null || value.isEmpty) return null;

    final number = int.tryParse(value);
    if (number == null) {
      return msg ?? 'This field is not a valid number';
    }

    if (number < min || number > max) {
      return msgOutOfRange ?? 'This field is out of range';
    }

    return null;
  }
}
