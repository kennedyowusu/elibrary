import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/constants/images.dart';
import 'package:elibrary/constants/project_dimensions.dart';
import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ProjectDimensions.heightTen * 11.5,
      width: ProjectDimensions.widthTen * 30,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundColor: ProjectColors.grey,
            backgroundImage: AssetImage(ProjectImages.logo),
          ),
        ],
      ),
    );
  }
}
