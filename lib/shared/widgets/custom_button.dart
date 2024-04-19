import 'package:flutter/material.dart';
import 'package:tennis_court/shared/shared.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color bgColor;
  final Color textColor;
  const CustomButton({
    super.key, 
  required this.text, 
  required this.onPressed, 
  this.bgColor = primaryColor,
  this.textColor = Colors.white
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: bgColor,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(2)
          )
        ),
         child: Text(text,
         style: TextStyle(
          color: textColor
         ),)
         ));
  }
}