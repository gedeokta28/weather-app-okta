import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_okta/core/presentation/widget/app_button.dart';
import 'package:weather_app_okta/core/static/colors.dart';
import 'package:weather_app_okta/core/utils/helper.dart';
import 'package:weather_app_okta/core/utils/validation_helper.dart';
import 'package:weather_app_okta/features/register/presentation/providers/register_providers.dart';

import '../../../../core/presentation/widget/custom_textfield.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterProvider>(builder: (context, provider, _) {
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
                  onChanged: (str) {
                    provider.refresh();
                  },
                  controller: provider.passwordController,
                  refresh: true,
                  onTap: () => provider.refresh(),
                  fieldValidator: ValidationHelper(
                    isError: (err) => provider.setPasswordError = err,
                    typeField: TypeField.password,
                  ).validate()),
              mediumVerticalSpacing(),
              CustomTextField(
                labelText: 'Password Confirmation',
                isSecure: true,
                refresh: true,
                onTap: () => provider.refresh(),
                controller: provider.confirmPasswordController,
                fieldValidator: ValidationHelper(
                  pwd: provider.passwordController.text,
                  isError: (err) => provider.setConfirmPasswordError = err,
                  typeField: TypeField.confirmationPassword,
                ).validate(),
              ),
              superLargeVerticalSpacing(),
              AppButton(
                backgroundColor: primaryColor,
                text: const Text(
                  'Sign up',
                  textAlign: TextAlign.center,
                ),
                onPressed: () async {
                  if (provider.formKey.currentState!.validate()) {
                    provider.signUp();
                  }
                },
              ),
            ],
          ));
    });
  }
}
