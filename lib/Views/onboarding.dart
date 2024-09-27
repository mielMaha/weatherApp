import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Models/onboarding_model.dart';
import '../Widget/DefoaltButton.dart';
import '../sheard/data/cache_helper.dart';
import 'Home_View.dart';

class Onboarding extends StatelessWidget {
  Onboarding({super.key});

  PageController Controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          child: PageView.builder(
            itemCount: OnBoardModel.OnBoardList.length,
            controller: Controller,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    index == 2
                        ? SizedBox(
                            width: 43,
                            height: 45,
                          )
                        : Align(
                            alignment: AlignmentDirectional.topStart,
                            child: TextButton(
                                onPressed: () {
                                  Controller.jumpToPage(2);
                                },
                                child: Text(
                                  'Skip',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(
                                          color:
                                              Colors.white.withOpacity(0.44)),
                                )),
                          ),
                    Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)),
                      child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          OnBoardModel.OnBoardList[index].path,
                        ),
                        width: 300,
                        height: 300,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    SmoothPageIndicator(
                      controller: Controller,
                      count: OnBoardModel.OnBoardList.length,
                      effect: ExpandingDotsEffect(
                        dotHeight: 6,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                        textAlign: TextAlign.center,
                        OnBoardModel.OnBoardList[index].Title,
                        style: Theme.of(context).textTheme.displayLarge),
                    SizedBox(
                      height: 42,
                    ),
                    Text(
                        textAlign: TextAlign.center,
                        OnBoardModel.OnBoardList[index].supTitle,
                        style: Theme.of(context).textTheme.displaySmall),
                    SizedBox(
                      height: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        index == 0
                            ? SizedBox(
                                width: 43,
                                height: 24,
                              )
                            : DefoaltButton(
                                text: 'Back',
                                color: Colors.black,
                                onPressed: () {
                                  Controller.previousPage(
                                      duration: Duration(seconds: 1),
                                      curve: Curves.ease);
                                },
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                        color: Colors.white.withOpacity(0.44)),
                              ),
                        DefoaltButton(
                            text: index != 2 ? 'Next' : "Get Started",
                            color: Colors.indigo,
                            onPressed: index != 2
                                ? () async {
                                    Controller.nextPage(
                                        duration: Duration(seconds: 1),
                                        curve: Curves.ease);
                                  }
                                : () async {
                                    await CacheHelper()
                                        .saveData(
                                            key: 'onborading', value: true)
                                        .then((_) {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Home_View()));
                                    });
                                  },
                            style: Theme.of(context).textTheme.displaySmall!)
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
