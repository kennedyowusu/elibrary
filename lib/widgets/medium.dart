import 'package:flutter/material.dart';

class MediumText extends StatelessWidget {
  MediumText({
    super.key,
    this.color = const Color(0xFF332D2B),
    required this.text,
    this.size = 0.0,
    this.overflow = TextOverflow.ellipsis,
  });

  Color? color;
  final String text;
  double size;
  TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize: size == size ? 16.0 : size,
        fontWeight: FontWeight.w400,
        fontFamily: 'Poppins',
      ),
    );
  }
}
