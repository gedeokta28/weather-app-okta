import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_okta/core/errors/failures.dart';
import 'package:weather_app_okta/core/static/dimens.dart';
import 'package:weather_app_okta/core/utils/injection.dart';

logMe(Object? obj, {String tag = 'log'}) {
  /* 
    use this for print something, its run only on debug mode.
  */
  if (kDebugMode) {
    print('$tag :$obj');
  }
}

BuildContext get globalContext =>
    locator<GlobalKey<NavigatorState>>().currentContext!;

Widget mediumHorizontalSpacing() => const SizedBox(width: sizeMedium);

Widget mediumVerticalSpacing() => const SizedBox(height: sizeMedium);

Widget smallHorizontalSpacing() => const SizedBox(width: sizeSmall);

Widget smallVerticalSpacing() => const SizedBox(height: sizeSmall);

Widget superLargeVerticalSpacing() => const SizedBox(height: sizeExtraLarge);

showLoading() {
  SmartDialog.showLoading(
    msg: 'Please wait...',
    backDismiss: false,
  );
}

dismissLoading() {
  SmartDialog.dismiss();
}

String getErrorMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ConnectionFailure:
      return 'Error Connection';
    case ServerFailure:
      return 'Server Error';
    default:
      return 'Unexpected Error';
  }
}

String getImageIcon(String value) {
  String result = "https://openweathermap.org/img/wn/$value@2x.png";
  return result;
}

String getTimestamp(int value) {
  var dt = DateTime.fromMillisecondsSinceEpoch(value * 1000);
  var result = DateFormat('EEEE, MMM d, yyyy HH:mm a').format(dt);
  return result;
}

String getOnlyDate(int value) {
  var dt = DateTime.fromMillisecondsSinceEpoch(value * 1000);
  var result = DateFormat('EEEE, MMM d, yyyy').format(dt);
  return result;
}

String getOnlyTime(int value) {
  var dt = DateTime.fromMillisecondsSinceEpoch(value * 1000);
  var result = DateFormat('HH:mm a').format(dt);
  return result;
}

Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
}
