import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Cubits/Cubit/Get_Weather_Cubit.dart';

class Searchbar extends StatefulWidget {
  Searchbar({super.key});

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> with TickerProviderStateMixin {
  @override
  late AnimationController _animationController;
  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    super.initState();
  }

  bool IsExpanded = false;

  Widget build(BuildContext context) {
    return   AnimatedContainer(
      duration: Duration(
        milliseconds: 400,
      ),
      width: IsExpanded ? 400 : 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            spreadRadius: -5,
            offset: Offset(0, 7),
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: InkWell(
              onTap: () {
                setState(() {
                  IsExpanded = !IsExpanded;
                  if (IsExpanded) {
                    _animationController.forward();
                  } else {
                    textEditingController.clear();
                    _animationController.reverse();
                  }
                });
              },
              child: Icon(
                Icons.search,
                size: 30,
              ),
            ),
          ),
          Expanded(
            child: AnimatedOpacity(
              opacity: IsExpanded ? 1 : 0,
              duration: Duration(milliseconds: 200),
              child: TextField(
                onSubmitted: (city){

                  BlocProvider.of<WeatherCubit>(context).GetWeather(city);


                },
                cursorRadius: Radius.circular(10),
                cursorWidth: 2,
                cursorColor: Colors.black,
                controller: textEditingController,
                decoration: InputDecoration(
                    labelText: 'search...',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    )),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Visibility(
                visible: IsExpanded,
                child: Padding(
                  child: AnimatedBuilder(animation: _animationController, builder: (context,builder){
                    return Transform.rotate(angle: _animationController.value*2*pi,child: builder,);
                  },
                    child: Icon(Icons.mic,size: 20,),
                  ),
                  padding: EdgeInsets.all(
                    8,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
