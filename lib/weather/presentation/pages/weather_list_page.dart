import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_okta/core/presentation/widget/custom_appbar.dart';
import 'package:weather_app_okta/core/static/colors.dart';
import 'package:weather_app_okta/core/utils/helper.dart';
import 'package:weather_app_okta/core/utils/injection.dart';
import 'package:weather_app_okta/core/utils/styles.dart';
import 'package:weather_app_okta/weather/presentation/provider/weather_list_provider.dart';
import 'package:weather_app_okta/weather/presentation/provider/weather_list_state.dart';

import 'package:weather_app_okta/weather/presentation/widget/weather_card.dart';

class WeatherListPage extends StatefulWidget {
  static const String routeName = '/weather-list';

  const WeatherListPage({Key? key}) : super(key: key);

  @override
  State<WeatherListPage> createState() => _WeatherListPageState();
}

class _WeatherListPageState extends State<WeatherListPage> {
  final _provider = locator<WeatherListProvider>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => _provider,
        builder: (context, child) {
          _provider.fetchData();
          return Scaffold(
              backgroundColor: primaryColor,
              appBar: const CustomAppBar(
                title: 'Weather App',
                titleColor: whiteColor,
                backgroundColor: primaryColor,
              ),
              body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Consumer<WeatherListProvider>(
                      builder: (context, value, child) {
                    final state = value.state;
                    if (state is WeatherListFailed) {
                      final failure = state.failure;
                      Fluttertoast.showToast(msg: getErrorMessage(failure));
                      return Text(
                        getErrorMessage(failure),
                        style: textWhite,
                      );
                    } else if (state is WeatherListLoaded) {
                      return ListView.builder(
                          itemCount: value.weatherList.list.length,
                          padding: const EdgeInsets.only(top: 10.0),
                          itemBuilder: (context, index) {
                            return WeatherCard(
                                data: value.weatherList.list[index]);
                          });
                    }
                    return const Center(
                        child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white)));
                  })));
        });
  }
}
