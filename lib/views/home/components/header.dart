import 'package:elibrary/constants/colors.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: height * 0.03),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Hello! ',
                    style: TextStyle(
                      color: ProjectColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: 'User Name',
                        style: TextStyle(
                          color: ProjectColors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Welcome to E-Library',
                  style: TextStyle(
                    fontSize: 16,
                    color: ProjectColors.black,
                  ),
                ),
              ],
            ),
          ),
          CircleAvatar(
            radius: height * 0.05,
            backgroundColor: ProjectColors.secondary,
            child: Icon(
              Icons.person,
              size: height * 0.060,
              color: ProjectColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
