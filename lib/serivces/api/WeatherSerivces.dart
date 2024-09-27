import 'package:dio/dio.dart';

import '../../Models/weatherModel.dart';


class Weather {
  final Dio dio;

  Weather({required this.dio});

  Future<WeatherModel> getWeather(String city,) async {
    try {
      Response response = await dio.get(
        'https://api.weatherapi.com/v1/forecast.json',
        queryParameters: {
          'key': '3a0397064be8450f981164547243007',
          'q': city,
          'days': 1,
          'aqi': 'no',
          'alerts': 'no',

        },
      );
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      String errorMessage = e.response?.data["error"]["message"] ?? "Oops, there was an error.";
      print(errorMessage);
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
