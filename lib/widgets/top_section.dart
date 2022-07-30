import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/views/home/home.dart';
import 'package:elibrary/widgets/button_nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopSection extends StatelessWidget {
  const TopSection(
      {Key? key,
      required this.width,
      required this.backIcon,
      required this.onPressed,
      required this.text,
      required this.height,
      required this.closeIcon})
      : super(key: key);

  final double width, height;
  final IconData backIcon, closeIcon;
  final Function onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: width * 0.12,
          height: height * 0.06,
          margin: EdgeInsets.only(top: height * 0.012),
          decoration: BoxDecoration(
            color: ProjectColors.secondary,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            icon: Icon(backIcon),
            onPressed: () => Get.back(),
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: ProjectColors.black,
          ),
        ),
        Container(
          width: width * 0.12,
          height: height * 0.06,
          margin: EdgeInsets.only(top: height * 0.012),
          decoration: BoxDecoration(
            color: ProjectColors.secondary,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            icon: Icon(closeIcon),
            onPressed: () {
              Get.to(
                () => BottomNavigation(),
              );
            },
          ),
        ),
      ],
    );
  }
}
