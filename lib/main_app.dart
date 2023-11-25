import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:weather_app_okta/core/utils/app_settings.dart';
import 'package:weather_app_okta/core/utils/injection.dart';
import 'package:weather_app_okta/core/utils/location_helper.dart';
import 'package:weather_app_okta/core/utils/themes.dart';
import 'package:weather_app_okta/features/login/presentation/pages/login_page.dart';
import 'package:weather_app_okta/weather/presentation/pages/weather_list_page.dart';
import 'core/route/route.dart' as router;

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    LocationHelper.handleLocationPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: locator<GlobalKey<NavigatorState>>(),
      title: appName,
      theme: themeData,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
      home: FirebaseAuth.instance.currentUser == null
          ? const LoginPage()
          : const WeatherListPage(),
      builder: FlutterSmartDialog.init(),
    );
  }
}
