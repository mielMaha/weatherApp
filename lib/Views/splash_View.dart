import 'package:flutter/material.dart';

import '../sheard/data/cache_helper.dart';
import 'Home_View.dart';
import 'onboarding.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 2),
      () => Navigator.push(context, MaterialPageRoute(builder: (context) {
        if (CacheHelper().getData(key: 'onborading') == false ||
            CacheHelper().getData(key: 'onborading') == null)
          return Onboarding();
        else
          return Home_View();
      })),
    );
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://p0.pikist.com/photos/742/864/mountain-stars-sky-milky-way-galaxy-reflection-tranquil-peaceful-mountain-range.jpg'),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: NetworkImage(
                  'https://cdn3d.iconscout.com/3d/premium/thumb/sun-with-rain-light-6624353-5526304.png'),
              fit: BoxFit.cover,
              width: 350,
              height: 350,
            ),
            Text("Weather App",
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(color: Colors.amber)),
            Text(
              "WelCome To Weather App",
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
