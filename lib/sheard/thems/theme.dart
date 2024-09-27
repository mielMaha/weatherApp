import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Cubits/Cubit/Get_Weather_Cubit.dart';
import '../../main.dart';


ThemeData themeData(context) {
  return ThemeData(
    // primarySwatch: BlocProvider.of<WeatherCubit>(context)
    //     .weatherModel
    //     ?.condition !=
    //     null
    //     ? getColorFromCondition(
    //     BlocProvider.of<WeatherCubit>(context)
    //         .weatherModel!
    //         .condition)
    //     : Colors.cyan,
    useMaterial3:false,
    appBarTheme: AppBarTheme(

      titleTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 32,
      )),

      backgroundColor: Color(0xFF240E4B),
    ),
    
    textTheme: TextTheme(
        displaySmall: GoogleFonts.montserrat(
          textStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),

        bodyMedium: GoogleFonts.sofadiOne(
          textStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        displayLarge: GoogleFonts.lato(
            textStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 32,
        ))),
  );
}
