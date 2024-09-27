import 'package:flutter/material.dart';
import 'package:weatherapp/Widget/searchBar.dart';

import '../Models/weatherModel.dart';
import '../main.dart';
import 'City_infoWeather.dart';
import 'Hours_List.dart';

class Infoweather extends StatelessWidget {
  Infoweather({super.key, required this.weatherModel});

  WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                'https://p0.pikist.com/photos/742/864/mountain-stars-sky-milky-way-galaxy-reflection-tranquil-peaceful-mountain-range.jpg'),
            fit: BoxFit.cover),
      ),
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          InfoCity(weatherModel: weatherModel),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Searchbar(),
          ),
        ],
      ),
    );
  }
}

class InfoCity extends StatelessWidget {
  const InfoCity({
    super.key,
    required this.weatherModel,
  });

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 40),
        Container(
          height: 200,
          child: CityInfoweather(weatherModel: weatherModel),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 40),
            child: SizedBox(
              width: 250, // Set the desired width
              height: 200, // Set the desired height
              child: Image.network(
                'https://i.postimg.cc/tCqpLvcL/C1z1rp1-Imgur.png',
                fit: BoxFit
                    .cover, // This will ensure the image fits within the size without being cropped
              ),
            ),
          ),
        ),
        Hours_List(weatherModel: weatherModel),
      ],
    );
  }
}

bool check(String img) {
  if (img.contains('https:'))
    return true;
  else
    return false;
}

String FormatTime(String time) {
  String hour = time.substring(10, 16);
  return hour;
}
