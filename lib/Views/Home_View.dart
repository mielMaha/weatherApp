import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Cubits/Cubit/Get_Weather_Cubit.dart';
import '../Cubits/Cubit/Get_Weather_State.dart';
import '../Widget/InfoWeather.dart';
import '../Widget/WelCome.dart';
import '../Widget/home_bottom_navigation_bar.dart';
import 'city_list.dart';

class Home_View extends StatefulWidget {
  Home_View({super.key});

  @override
  State<Home_View> createState() => _Home_ViewState();
}

class _Home_ViewState extends State<Home_View> {
  @override
  List<Widget> screan = <Widget>[NewWidget(), CityList()];
  final pageController = PageController(initialPage: 0);
  final NotchBottomBarController controller =
      NotchBottomBarController(index: 0);
  void dispose() {
    pageController.dispose();
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    int i = BlocProvider.of<WeatherCubit>(context).bottomNavIndex;
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(screan.length, (index) => screan[index]),
        ),
        bottomNavigationBar: Container(
          width: double.infinity,
          height: 80,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://sumaran.net/wp-content/uploads/img3/1080x2400/gingamoutain2400x1080.jpg"),
                fit: BoxFit.cover),
          ),
          child: HomeBottomNavigationBar(
            controller: controller,
            pageController: pageController,
          ),
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherStates>(
      builder: (BuildContext context, WeatherStates state) {
        if (state is NoWeatherState) {
          return WelCome();
        } else if (state is WeatherInfoState) {
          return Infoweather(
              weatherModel:
                  BlocProvider.of<WeatherCubit>(context).weatherModel!);
        } else if (state is ErorrState) {
          return Text(
            "Oops there was an error",
          );
        } else
          return CircularProgressIndicator();
      },
    );
  }
}
