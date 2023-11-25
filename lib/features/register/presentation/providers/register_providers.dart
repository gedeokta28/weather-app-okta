import 'package:weather_app_okta/core/utils/firebase_auth_helper.dart';
import 'package:weather_app_okta/core/utils/helper.dart';

import '../../../../core/presentation/providers/form_provider.dart';

class RegisterProvider extends FormProvider {
  final FirebaseAuthService _auth = FirebaseAuthService();
  RegisterProvider();

  void signUp() async {
    showLoading();
    String email = emailController.text;
    String password = passwordController.text;
    await _auth.signUpWithEmailAndPassword(email, password);
    dismissLoading();
  }
}
