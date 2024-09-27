import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Models/weatherModel.dart';
import '../../serivces/api/WeatherSerivces.dart';
import '../../sheard/data/Sqflite_Helper.dart';
import 'Get_Weather_State.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  WeatherCubit() : super(NoWeatherState());
  WeatherModel? weatherModel;

  int bottomNavIndex = 1;

  GetWeather(String city) async {
    try {
      weatherModel = await Weather(dio: Dio()).getWeather(
        city,
      );
      Sqflite_Helper().insert(weatherModel!);
      bottomNavIndex++;

      emit(WeatherInfoState());
    } catch (e) {
      emit(ErorrState());
    }
  }

  loadcity() async {
    try {
      List<Map> data = await Sqflite_Helper().loadData();
      emit(loadcitysucsess(data));
    } catch (e) {
      emit(erorrcityLoad());
      print(e);
    }
  }
}
