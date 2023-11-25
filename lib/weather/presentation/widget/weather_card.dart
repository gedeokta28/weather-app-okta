import 'package:flutter/material.dart';
import 'package:weather_app_okta/core/static/colors.dart';
import 'package:weather_app_okta/core/utils/helper.dart';
import 'package:weather_app_okta/core/utils/styles.dart';
import 'package:weather_app_okta/weather/data/models/weather_list_model.dart';

class WeatherCard extends StatefulWidget {
  final WeatherElement data;
  const WeatherCard({Key? key, required this.data}) : super(key: key);

  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Card(
        color: cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: <Widget>[
                  Image.network(
                      height: 80, getImageIcon(widget.data.weather[0].icon)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        getTimestamp(widget.data.dt),
                        style: textWhiteBold,
                      ),
                      smallVerticalSpacing(),
                      Text(
                        widget.data.weather[0].main,
                        style: textWhite,
                      ),
                      smallVerticalSpacing(),
                      Text(
                        '${widget.data.main.temp}°C',
                        style: textTemp,
                      ),
                    ],
                  ),
                  // Expanded(
                  //   child: Row(
                  //     children: [
                  //       SizedBox(
                  //         width: 60,
                  //         child: Text(
                  //           widget.data.main.temp.toString(),
                  //           style: textTemp,
                  //         ),
                  //       ),
                  //       Expanded(
                  //           child: Image.network(
                  //               height: 60,
                  //               getImageIcon(widget.data.weather[0].icon))),
                  //     ],
                  //   ),
                  // ),
                  // Expanded(
                  //   child: Text(
                  //     widget.data.main.temp.toString(),
                  //     style: textTemp,
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
