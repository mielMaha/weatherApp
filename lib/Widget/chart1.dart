import 'package:flutter/material.dart';

class CurvedContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200, // Adjust width
          height: 100, // Adjust height
          decoration: BoxDecoration(
            color:
                Color(0xFF5A2DFF), // Change this to your desired color (Purple)
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0), // Customize the curves
              topRight: Radius.circular(40.0),
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
            ),
          ),
        ),
      ),
    );
  }
}
