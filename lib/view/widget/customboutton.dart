import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;

  final Color color;
  final void Function()? onPressed;

  const CustomButton({Key? key, required this.text, required this.color, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(text, style: const TextStyle(color: Colors.white)),
      color: color,
      height: 51,
      minWidth: 349,
     );
  }
}
