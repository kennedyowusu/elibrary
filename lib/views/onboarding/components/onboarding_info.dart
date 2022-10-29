import 'package:elibrary/constants/colors.dart';
import 'package:flutter/material.dart';

class OnboardingInfo extends StatelessWidget {
  const OnboardingInfo(
      {Key? key,
      required this.imageAsset,
      required this.title,
      required this.description})
      : super(key: key);

  final String imageAsset;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imageAsset),
        SizedBox(height: 12),
        Text(
          title.toUpperCase(),
          style: TextStyle(fontSize: 13, color: ProjectColors.primary),
        ),
        SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64.0),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10),
          ),
        ),
      ],
    );
  }
}
