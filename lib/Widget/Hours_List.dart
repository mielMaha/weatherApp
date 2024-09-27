
import 'package:flutter/material.dart';

import '../Models/weatherModel.dart';
import 'InfoWeather.dart';

class Hours_List extends StatelessWidget {
   Hours_List({
    super.key,
    required this.weatherModel,
  });

   WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: weatherModel.hours.length,
          itemBuilder: (context, index) {
            return oneHour(weatherModel: weatherModel, index: index,);
          }),
    );
  }
}

class oneHour extends StatelessWidget {
  const oneHour({
    super.key,
    required this.weatherModel, required this.index,
  });

  final WeatherModel weatherModel;
 final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: Colors.blueGrey.withOpacity(.3),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(' hour: ${FormatTime(weatherModel.hours[index]["time"])}'),
            SizedBox(
              height: 5,
            ),
            Text('temp :${weatherModel.hours[index]["temp_c"].toInt()}'),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              width: 50,
              height: 50,
              child: Image.network(
                '${check(weatherModel.hours[index]["condition"]["icon"]) ? weatherModel.hours[index]["condition"]["icon"] : "https:" + weatherModel.hours[index]["condition"]["icon"]}',
                width: 50,
                height: 50,
              ),
            ),
            Text('${weatherModel.hours[index]["condition"]["text"]}'),
          ],
        ),
      ),
    );
  }
}