import 'package:weather_app_okta/core/utils/firebase_auth_helper.dart';
import 'package:weather_app_okta/core/utils/helper.dart';

import '../../../../core/presentation/providers/form_provider.dart';

class LoginProvider extends FormProvider {
  final FirebaseAuthService _auth = FirebaseAuthService();
  LoginProvider();

  void signIn() async {
    showLoading();
    String email = emailController.text;
    String password = passwordController.text;
    await _auth.signInWithEmailAndPassword(email, password);
    dismissLoading();
  }
}
