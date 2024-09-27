import 'package:flutter/material.dart';

class DefoaltButton extends StatelessWidget {
  DefoaltButton(
      {super.key,
        required this.text,
        required this.color,
        required this.onPressed, required this.style, this.size});
  final TextStyle style;
  var onPressed;
  final String text;
  final Color color;
  final Size? size;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: style,
      ),
      style: ElevatedButton.styleFrom(

        minimumSize:size!=null? size:null,
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
