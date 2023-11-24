import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:weather_app_okta/core/static/dimens.dart';

logMe(Object? obj, {String tag = 'log'}) {
  /* 
    use this for print something, its run only on debug mode.
  */
  if (kDebugMode) {
    print('$tag :$obj');
  }
}

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
