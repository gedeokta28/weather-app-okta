import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_okta/core/static/colors.dart';
import 'package:weather_app_okta/core/utils/helper.dart';
import 'package:weather_app_okta/core/utils/styles.dart';
import 'package:weather_app_okta/features/weather/data/models/weather_list_model.dart';

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
                  CachedNetworkImage(
                    imageUrl: getImageIcon(widget.data.weather[0].icon),
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          getOnlyDate(widget.data.dt),
                          style: textWhiteBold,
                          maxLines: 2,
                        ),
                        Text(
                          getOnlyTime(widget.data.dt),
                          style: textWhiteBold,
                          maxLines: 2,
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
