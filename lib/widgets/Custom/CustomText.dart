import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String message;
  final double fontSize;
  final Color color;
  const CustomText(this.message,
      {Key key, this.fontSize = 20, this.color = Colors.red})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.message,
      style: TextStyle(
          color: this.color, fontFamily: "Knewave", fontSize: this.fontSize),
    );
  }
}
