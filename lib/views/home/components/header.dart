import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/model/user.dart';
import 'package:elibrary/utils/shared_prefs.dart';
import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({
    Key? key,
    required this.height,
    required this.user,
  }) : super(key: key);

  final double height;
  final User user;

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    debugPrint('Header build' + widget.user.toString());

    return Padding(
      padding: EdgeInsets.only(top: widget.height * 0.03),
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
                        text: widget.user.name.split(' ')[0],
                        style: TextStyle(
                          color: ProjectColors.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
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
            radius: widget.height * 0.05,
            backgroundColor: ProjectColors.secondary,
            child: Icon(
              Icons.person,
              size: widget.height * 0.060,
              color: ProjectColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
