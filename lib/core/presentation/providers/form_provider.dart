import 'package:flutter/material.dart';

class FormProvider with ChangeNotifier {
  /*
    Contains all about Form:
    - TextEditingController
    - FormKey
    - etc
  */

  // init
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _emailError = false;
  bool _passwordError = false;
  bool _confirmPasswordError = false;

  // setter
  set setEmailError(val) {
    _emailError = val;
    notifyListeners();
  }

  set setPasswordError(val) {
    _passwordError = val;
    notifyListeners();
  }

  set setConfirmPasswordError(val) {
    _confirmPasswordError = val;
    notifyListeners();
  }

  // getter
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  GlobalKey<FormState> get formKey => _formKey;

  bool get emailError => _emailError;
  bool get passwordError => _passwordError;
  bool get confirmPasswordError => _confirmPasswordError;

  refresh() {
    notifyListeners();
  }

  // constructor
  FormProvider();
}
