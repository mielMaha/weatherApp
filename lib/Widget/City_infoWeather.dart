import 'package:flutter/material.dart';


import '../Models/weatherModel.dart';
import 'InfoWeather.dart';

class CityInfoweather extends StatelessWidget {
  CityInfoweather({super.key, required this.weatherModel});

  WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    var largeText=Theme.of(context).textTheme.displayLarge;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${weatherModel.city}',
              style: largeText!.copyWith(fontWeight: FontWeight.w200)),
          Text('${weatherModel.aver}°',
              style: largeText!.copyWith(fontSize: 40,fontWeight: FontWeight.w200)),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: Image.network(
                  '${check(weatherModel.image) ? weatherModel.image : "https:" + weatherModel.image}',

                ),
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Max t:  ${weatherModel.Max.toInt()}'),
                  Text('min t:  ${weatherModel.min.toInt()}'),

                ],
              )
            ],
          ),

          Text(
            '${weatherModel.condition}',
            style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
          ),
          // SizedBox(
          //   height: 50,
          // ),
        ],
      ),
    );
  }
}
