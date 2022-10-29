import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/constants/styles.dart';
import 'package:elibrary/utils/helper.dart';
import 'package:flutter/material.dart';

class ProjectAppBar extends StatefulWidget {
  ProjectAppBar({
    super.key,
    required this.height,
    required this.onPressed,
  });

  final double height;
  final Function onPressed;

  @override
  State<ProjectAppBar> createState() => _ProjectAppBarState();
}

class _ProjectAppBarState extends State<ProjectAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          widget.onPressed();
        },
        icon: Icon(
          Icons.menu,
          color: ProjectColors.black,
        ),
      ),
      title: sText(
        'Edu Library',
        size: 20 * ProjectStyle.kMultiplier * widget.height,
        weight: FontWeight.w700,
        align: TextAlign.center,
        maxLines: 1,
        lHeight: 1.2,
      ),
      automaticallyImplyLeading: false,
      backgroundColor: ProjectColors.white,
      centerTitle: true,
      elevation: 0.0,
      actions: [
        IconButton(
          icon: Icon(
            Icons.notifications_none_outlined,
            color: ProjectColors.black,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
