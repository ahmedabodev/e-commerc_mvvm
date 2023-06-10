import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  dynamic title;
  dynamic onPressed;
  dynamic minWidth;
  dynamic color;
  @override
  Widget build(BuildContext context) {
    return  MaterialButton(
      elevation: 8,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
      minWidth:minWidth ,
      color: color,
      onPressed: onPressed,
      child: title,

    );
  }

  CustomButtonWidget({
    required this.title,
    required this.onPressed,
    required this.minWidth,
    required this.color,
  });
}
