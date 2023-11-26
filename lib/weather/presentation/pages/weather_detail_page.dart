import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_okta/core/presentation/widget/custom_appbar.dart';
import 'package:weather_app_okta/core/static/colors.dart';
import 'package:weather_app_okta/core/utils/helper.dart';
import 'package:weather_app_okta/core/utils/styles.dart';
import 'package:weather_app_okta/weather/data/models/weather_list_model.dart';

class WeatherDetailPagerguments {
  final WeatherListModel weatherData;
  final int index;

  WeatherDetailPagerguments({
    required this.weatherData,
    required this.index,
  });
}

class WeatherDetailPage extends StatefulWidget {
  final WeatherListModel weatherData;
  final int index;
  static const String routeName = '/weather-detail';

  const WeatherDetailPage(
      {Key? key, required this.weatherData, required this.index})
      : super(key: key);

  @override
  State<WeatherDetailPage> createState() => _WeatherDetailPageState();
}

class _WeatherDetailPageState extends State<WeatherDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: const CustomAppBar(
          title: 'Weather Details',
          centerTitle: true,
          titleColor: whiteColor,
          backgroundColor: primaryColor,
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: cardColor,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 150,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: whiteColor,
                                  size: 20,
                                ),
                                smallHorizontalSpacing(),
                                Text(
                                  "${widget.weatherData.city.name} (${widget.weatherData.city.country})",
                                  style: textWhiteBold,
                                )
                              ],
                            ),
                          )),
                    ),
                    mediumVerticalSpacing(),
                    Text(
                      getOnlyDate(widget.weatherData.list[widget.index].dt),
                      style: textWhiteStyle(17, true),
                    ),
                    smallVerticalSpacing(),
                    Text(
                      getOnlyTime(widget.weatherData.list[widget.index].dt),
                      style: textWhiteStyle(20, false),
                    ),
                    superLargeVerticalSpacing(),
                    CachedNetworkImage(
                      width: 130,
                      imageUrl: getImageIcon(widget
                          .weatherData.list[widget.index].weather[0].icon),
                      fit: BoxFit.fill,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    Text(
                      '${widget.weatherData.list[widget.index].main.temp}°C',
                      style: textWhiteStyle(50, true),
                    ),
                    Text(
                      "${widget.weatherData.list[widget.index].weather[0].main} (${widget.weatherData.list[widget.index].weather[0].description})",
                      style: textWhiteStyle(16, true),
                    ),
                    superLargeVerticalSpacing(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Temp (Min)',
                              style: textWhiteStyle(15, false),
                            ),
                            Text(
                              '${widget.weatherData.list[widget.index].main.tempMin}°C',
                              style: textWhiteStyle(17, true),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Container(
                          width: 1,
                          height: 50,
                          color: accentColor,
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Column(
                          children: [
                            Text(
                              'Temp (Max)',
                              style: textWhiteStyle(15, false),
                            ),
                            Text(
                              '${widget.weatherData.list[widget.index].main.tempMax}°C',
                              style: textWhiteStyle(17, true),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )),
        ));
  }
}
