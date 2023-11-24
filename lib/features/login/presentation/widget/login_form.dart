import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_okta/core/presentation/widget/app_button.dart';
import 'package:weather_app_okta/core/static/colors.dart';
import 'package:weather_app_okta/core/utils/helper.dart';
import 'package:weather_app_okta/core/utils/validation_helper.dart';
import 'package:weather_app_okta/features/login/presentation/providers/login_providers.dart';

import '../../../../core/presentation/widget/custom_textfield.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context, provider, _) {
      return Form(
          key: provider.formKey,
          child: Column(
            children: [
              CustomTextField(
                inputType: TextInputType.emailAddress,
                labelText: 'Email',
                controller: provider.emailController,
                fieldValidator: ValidationHelper(
                  isError: (err) => provider.setEmailError = err,
                  typeField: TypeField.email,
                ).validate(),
              ),
              mediumVerticalSpacing(),
              CustomTextField(
                  labelText: 'Password',
                  isSecure: true,
                  controller: provider.passwordController,
                  fieldValidator: ValidationHelper(
                    isError: (err) => provider.setPasswordError = err,
                    typeField: TypeField.password,
                  ).validate()),
              superLargeVerticalSpacing(),
              AppButton(
                backgroundColor: primaryColor,
                text: const Text(
                  'Log In',
                  textAlign: TextAlign.center,
                ),
                onPressed: () async {
                  if (provider.formKey.currentState!.validate()) {
                    provider.signIn();
                  }
                },
              ),
            ],
          ));
    });
  }
}
