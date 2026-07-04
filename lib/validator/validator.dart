import 'package:flutter_core_package/validator/validations.dart';
import 'package:flutter/material.dart';

/// a utility class for applying multiple validations to a form field.
class Validator {
  Validator._(); // private constructor to prevent instantiation

  /// Applies a list of [validations] to a form field value.
  static FormFieldValidator<T> apply<T>(BuildContext context, List<Validation<T>> validations) {
    return (T? value) {
      for (final validation in validations) {
        final error = validation.validate(context, value);
        if (error != null) return error;
      }
      return null;
    };
  }
}
