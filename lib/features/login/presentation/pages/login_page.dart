import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_okta/core/static/assets.dart';
import 'package:weather_app_okta/core/static/colors.dart';
import 'package:weather_app_okta/core/static/dimens.dart';
import 'package:weather_app_okta/core/utils/app_settings.dart';
import 'package:weather_app_okta/core/utils/helper.dart';
import 'package:weather_app_okta/core/utils/injection.dart';
import 'package:weather_app_okta/features/login/presentation/providers/login_providers.dart';
import 'package:weather_app_okta/features/login/presentation/widget/login_form.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => locator<LoginProvider>(),
      builder: (context, child) => Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 2 / 1.7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        assetLogin,
                        fit: BoxFit.cover,
                        width: 120,
                      ),
                      mediumVerticalSpacing(),
                      const Text(appName,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: sizeLarge,
                          )),
                    ],
                  ),
                ),
                const LoginForm()
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: whiteColor,
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(
                    fontSize: 15,
                    color: primaryColor,
                  ),
                ),
                smallHorizontalSpacing(),
                const Text(
                  "Sign up.",
                  style: TextStyle(
                      fontSize: 15,
                      color: primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
