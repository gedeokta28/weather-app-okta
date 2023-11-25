import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_okta/core/static/assets.dart';
import 'package:weather_app_okta/core/static/colors.dart';
import 'package:weather_app_okta/core/static/dimens.dart';
import 'package:weather_app_okta/core/utils/helper.dart';
import 'package:weather_app_okta/core/utils/injection.dart';
import 'package:weather_app_okta/features/login/presentation/pages/login_page.dart';
import 'package:weather_app_okta/features/register/presentation/providers/register_providers.dart';
import 'package:weather_app_okta/features/register/presentation/widget/register_form.dart';

class RegisterPage extends StatefulWidget {
  static const String routeName = '/register';

  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => locator<RegisterProvider>(),
      builder: (context, child) => Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 2 / 1.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        assetProfile,
                        fit: BoxFit.cover,
                        width: 120,
                      ),
                      mediumVerticalSpacing(),
                      const Text('Register',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: sizeLarge,
                          )),
                    ],
                  ),
                ),
                const RegisterForm()
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
                  "Already have an account?",
                  style: TextStyle(
                    fontSize: 15,
                    color: primaryColor,
                  ),
                ),
                smallHorizontalSpacing(),
                InkWell(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      LoginPage.routeName,
                      (route) => false,
                    );
                  },
                  child: const Text(
                    "Log in.",
                    style: TextStyle(
                        fontSize: 16,
                        color: primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
