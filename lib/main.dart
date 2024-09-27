import 'package:flutter/material.dart'; // This includes the Colors class

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/sheard/data/Sqflite_Helper.dart';
import 'package:weatherapp/sheard/data/cache_helper.dart';
import 'package:weatherapp/sheard/thems/theme.dart';

import 'Cubits/Cubit/Get_Weather_Cubit.dart';
import 'Cubits/Cubit/Get_Weather_State.dart';
import 'Views/splash_View.dart';
import 'Widget/chart1.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await Sqflite_Helper().getDatabase();
  runApp(
    const WeatherApp(),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: BlocBuilder<WeatherCubit, WeatherStates>(
        builder: (BuildContext context, WeatherStates state) {
          return Builder(builder: (context) {
            return MaterialApp(
              theme: themeData(context),
              debugShowCheckedModeBanner: false,
              home: SplashView(),
            );
          });
        },
      ),
    );
  }
}
