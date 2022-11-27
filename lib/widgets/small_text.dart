import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  SmallText({
    super.key,
    this.color = const Color(0xFF332D2B),
    required this.text,
    this.size = 12.0,
    this.height = 1.2,
  });

  Color? color;
  final String text;
  double size, height;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.justify,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontFamily: 'Poppins',
        height: height,
      ),
    );
  }
}
