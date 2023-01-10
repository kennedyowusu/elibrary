import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/constants/images.dart';
import 'package:elibrary/routes/routes.dart';
import 'package:elibrary/views/home/components/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: ProjectColors.primary,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 80, 24, 0),
          child: Column(
            children: [
              headerWidget(),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                thickness: 1,
                height: 10,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 20,
              ),
              DrawerItem(
                name: 'Home',
                icon: Icons.home_outlined,
                onPressed: () => onItemPressed(context, index: 0),
              ),
              const SizedBox(
                height: 20,
              ),
              DrawerItem(
                name: 'Saved Books',
                icon: Icons.book_outlined,
                onPressed: () => onItemPressed(context, index: 1),
              ),
              const SizedBox(
                height: 20,
              ),
              DrawerItem(
                name: 'Borrowed Books',
                icon: Icons.book_online_outlined,
                onPressed: () => onItemPressed(context, index: 2),
              ),
              const SizedBox(
                height: 20,
              ),
              DrawerItem(
                name: 'Account',
                icon: Icons.account_box_rounded,
                onPressed: () => onItemPressed(context, index: 3),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                thickness: 1,
                height: 10,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 20,
              ),
              DrawerItem(
                name: 'Log out',
                icon: Icons.logout,
                onPressed: () => onItemPressed(context, index: 4),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}) {
    Navigator.pop(context);

    switch (index) {
      case 0:
        Get.toNamed(
          RouteHelper.getInitialRoute(),
        );
        break;

      case 1:
        Get.toNamed(
          RouteHelper.getSavedBooks(),
        );
        break;

      case 2:
        Get.toNamed(
          RouteHelper.getBorrowedBooks(),
        );
        break;

      case 3:
        Get.toNamed(
          RouteHelper.getProfile(),
        );
        break;

      case 4:
        Get.toNamed(
          RouteHelper.getLoginScreen(),
        );
        break;
    }
  }

  Widget headerWidget() {
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.white,
          child: Image.asset(
            ProjectImages.logo,
            height: 80,
            width: 80,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Person name',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'person@email.com',
              style: TextStyle(fontSize: 14, color: Colors.white),
            )
          ],
        )
      ],
    );
  }
}
