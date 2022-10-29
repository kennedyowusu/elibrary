import 'package:flutter/material.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "Your Name",
            iconData: Icons.person,
            press: () => {},
          ),
          ProfileMenu(
            text: "Your Student Index",
            iconData: Icons.phone_android_sharp,
            press: () {},
          ),
          ProfileMenu(
            text: "Your Phone",
            iconData: Icons.phone_android_sharp,
            press: () {},
          ),
          ProfileMenu(
            text: "Your Student Email",
            iconData: Icons.email,
            press: () {},
          ),
          ProfileMenu(
            text: "Department",
            iconData: Icons.location_on,
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            iconData: Icons.logout,
            press: () {},
          ),
        ],
      ),
    );
  }
}
