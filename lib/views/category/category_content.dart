import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/constants/styles.dart';
import 'package:elibrary/model/categories.dart';
import 'package:elibrary/utils/helper.dart';
import 'package:elibrary/views/home/components/nav_drawer.dart';
import 'package:elibrary/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryContentScreen extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  CategoryContentScreen({super.key});

  var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    debugPrint("This is the content of ${data.toString()}");

    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: ProjectColors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: ProjectColors.white,
          centerTitle: true,
          elevation: 0.0,
          title: sText(
            data ?? 'Edu Library',
            size: 20 * ProjectStyle.kMultiplier * height,
            weight: FontWeight.w700,
            align: TextAlign.center,
            maxLines: 1,
            lHeight: 1.2,
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.notifications_none_outlined,
                color: ProjectColors.black,
              ),
              onPressed: () {},
            ),
          ],
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: ProjectColors.black,
            ),
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
          ),
        ),
        drawer: NavigationDrawer(),
        body: SingleChildScrollView(
          child: Center(
            child: Text(
              data ?? "No data",
              style: TextStyle(
                fontSize: 20.0 * ProjectStyle.kMultiplier * height,
                fontWeight: FontWeight.w600,
                color: ProjectColors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
