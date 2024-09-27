import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';



class HomeBottomNavigationBar extends StatelessWidget {
   HomeBottomNavigationBar({super.key, required this.pageController, required this.controller});
  final PageController pageController;
  final NotchBottomBarController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedNotchBottomBar(
      notchBottomBarController: controller,
      color: Colors.white10,
      showLabel: true,
      textOverflow: TextOverflow.visible,
      maxLine: 1,
      shadowElevation: 5,
      kBottomRadius: 15.0,
      notchColor: Colors.white,
      removeMargins: false,
      bottomBarWidth: 500,
      showShadow: false,
      durationInMilliSeconds: 300,
      itemLabelStyle: const TextStyle(fontSize: 13, color: Colors.white),
      elevation: 1,
      bottomBarItems: const [

        BottomBarItem(
          inActiveItem: Icon(Icons.home, color: Colors.white),
          activeItem: Icon(
            Icons.home,
            color: Colors.black,
          ),
          itemLabel: 'home',
        ),

        BottomBarItem(
          inActiveItem: Icon(
            Icons.list,
            color: Colors.white,
          ),
          activeItem: Icon(
            Icons.list,
            color: Colors.deepPurple,
          ),
          itemLabel: 'list',
        ),
      ],
      onTap: (index) {
        pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      kIconSize: 24.0,
    );
  }
}