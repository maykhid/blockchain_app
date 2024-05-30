import 'package:formz/formz.dart';

enum EmailValidationError {
  /// Generic invalid error.
  invalid
}

/// {@template email}
/// Form input for an email input.
/// {@endtemplate}
class Email extends FormzInput<String, EmailValidationError> {
  /// {@macro email}
  const Email.pure() : super.pure('');

  /// {@macro email}
  const Email.dirty([super.value = '']) : super.dirty();

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  EmailValidationError? validator(String? value) {
    return _emailRegExp.hasMatch(value ?? '')
        ? null
        : EmailValidationError.invalid;
  }
}

enum PasswordValidationError {
  /// Generic invalid error.
  invalid,
  empty,
  minLength
}


class PasswordLogin extends FormzInput<String, PasswordValidationError> {
  /// {@macro password}
  const PasswordLogin.pure() : super.pure('');

  /// {@macro password}
  const PasswordLogin.dirty([super.value = '']) : super.dirty();
  static const _minLength = 8;

  @override
  PasswordValidationError? validator(String? value) {
    if (value?.isEmpty ?? true) {
      return PasswordValidationError.empty;
    } else if (value!.length < _minLength) {
      return PasswordValidationError.minLength;
    }
    return null;
  }
}

extension PasswordValidationErrorMessage on PasswordValidationError {
  String get message {
    switch (this) {
      case PasswordValidationError.empty:
        return 'Password cannot be empty.';
      case PasswordValidationError.minLength:
        return 'Password must be at least 8 characters long.';
      case PasswordValidationError.invalid:
        return 'Password must contain at least\none lowercase letter, \none uppercase letter,\none digit \nand a special character.';
    }
  }
}
