import 'package:flutter/material.dart';

class CustomActionButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color? bgColor;
  const CustomActionButton({super.key, required this.text, required this.onPressed,this.bgColor});

  @override
  Widget build(BuildContext context) {
    // TODO: falta implementacion de las funciones
    final colors = Theme.of(context).colorScheme;
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: bgColor ?? colors.background,
        elevation: 2 ,
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(2),
          side:  BorderSide(
            width: .5,
            color: colors.onBackground
          )
        )
      ),
       child: Text(text,
       style: TextStyle(
        color: colors.onBackground
       ),));
  }
}