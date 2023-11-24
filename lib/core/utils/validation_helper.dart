import 'package:flutter/material.dart';

enum TypeField {
  email,
  password,
}

class ValidationHelper {
  final Function(bool value) isError;
  final TypeField typeField;

  ValidationHelper({required this.isError, required this.typeField});

  FormFieldValidator validate() {
    String? message;
    return (value) {
      final strValue = value as String;
      if (strValue.isEmpty) {
        message = 'This field is required';
        isError(true);
      } else {
        switch (typeField) {
          case TypeField.email:
            Pattern pattern =
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
            RegExp emailRegex = RegExp(pattern.toString());
            if (!emailRegex.hasMatch(strValue)) {
              message = '※ Email address format is incorrect';
              isError(true);
            } else {
              isError(false);
            }
            break;
          case TypeField.password:
            if (strValue.length < 8) {
              message = 'Please set the password with 8 characters or more';
              isError(true);
            }
            break;
          default:
            isError(false);
        }
      }

      return message;
    };
  }
}
