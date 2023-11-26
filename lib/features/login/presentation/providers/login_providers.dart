import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather_app_okta/core/utils/firebase_auth_helper.dart';
import 'package:weather_app_okta/core/utils/helper.dart';
import 'package:weather_app_okta/core/utils/location_helper.dart';

import '../../../../core/presentation/providers/form_provider.dart';

class LoginProvider extends FormProvider {
  final FirebaseAuthService _auth = FirebaseAuthService();
  LoginProvider();

  void signIn() async {
    if (await LocationHelper.handleLocationPermission()) {
      showLoading();
      String email = emailController.text;
      String password = passwordController.text;
      await _auth.signInWithEmailAndPassword(email, password);
      dismissLoading();
    } else {
      Fluttertoast.showToast(msg: 'Please allow location to start this app');
    }
  }
}
