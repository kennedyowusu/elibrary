import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/constants/project_dimensions.dart';
import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.iconData,
    this.press,
  }) : super(key: key);

  final String text;
  final IconData iconData;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: GestureDetector(
        onTap: () {
          press!();
        },
        child: Container(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          decoration: BoxDecoration(
            color: Color(0xFFF5F6F9),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              Container(
                height: ProjectDimensions.heightTwenty * 3,
                width: ProjectDimensions.widthTwenty * 3,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ProjectColors.white,
                    width: 2.0,
                  ),
                ),
                child: Icon(
                  iconData,
                  color: ProjectColors.primary,
                  size: ProjectDimensions.heightTen * 2,
                ),
              ),
              SizedBox(width: 20),
              Expanded(child: Text(text)),
              // Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}
