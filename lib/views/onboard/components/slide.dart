import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Slider extends StatelessWidget {
  String image, title, description;

  Slider({required this.image, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage(image)),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 12),
          Text(description),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}
