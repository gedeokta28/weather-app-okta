import 'package:flutter/material.dart';
import 'package:weather_app_okta/core/utils/helper.dart';

enum TypeField { email, password, confirmationPassword }

class ValidationHelper {
  final Function(bool value) isError;
  final TypeField typeField;
  final String?
      pwd; // this value for matching between 'confirmation password' with 'password'

  ValidationHelper({
    required this.isError,
    required this.typeField,
    this.pwd = '',
  });

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
          case TypeField.confirmationPassword:
            if (strValue.length < 8) {
              message = 'Please set the password with 8 characters or more';
              isError(true);
              break;
            }
            if (strValue != pwd) {
              message = "Confirmation password doesn't match";
              isError(true);
            } else {
              isError(false);
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
