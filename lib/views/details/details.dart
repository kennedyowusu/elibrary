import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/constants/images.dart';
import 'package:elibrary/constants/styles.dart';
import 'package:elibrary/routes/routes.dart';
import 'package:elibrary/utils/helper.dart';
import 'package:elibrary/views/home/components/nav_drawer.dart';
import 'package:elibrary/widgets/app_bar.dart';
import 'package:elibrary/widgets/medium.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({super.key});
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: ProjectColors.white,
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(
            60.0 * ProjectStyle.kMultiplier * height,
          ),
          child: ProjectAppBar(
            height: height,
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
          ),
        ),
        drawer: NavigationDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: height * 0.5,
                  width: width,
                  child: Image.asset(
                    ProjectImages.logo,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: height * 0.42,
                  left: width * 0.05,
                  right: width * 0.05,
                  child: Container(
                    height: height * 0.07,
                    width: width,
                    decoration: BoxDecoration(
                      color: ProjectColors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(5.0),
                      boxShadow: [
                        BoxShadow(
                          color: ProjectColors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'The Book Title Here',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18.0 * ProjectStyle.kMultiplier * height,
                          color: ProjectColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // description
            Padding(
              padding: EdgeInsets.only(
                left: width * 0.05,
                right: width * 0.05,
                top: height * 0.01,
              ),
              child: Text(
                'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source from a Lorem Ipsum passage, and going through the cites of the word in classical literature,',
                style: appStyle(
                  size: 18.0 * ProjectStyle.kMultiplier * height,
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: height * 0.120,
          padding: EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 20.0,
            bottom: 30.0,
          ),
          decoration: BoxDecoration(
            color: ProjectColors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Icon(
                  Icons.bookmark_border_rounded,
                  size: width * 0.10,
                  color: ProjectColors.white,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(
                    RouteHelper.getRequestBookRoute(),
                  );
                },
                child: Container(
                  height: height * 0.10,
                  width: width * 0.5,
                  decoration: BoxDecoration(
                    color: ProjectColors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Center(
                    child: MediumText(
                      text: 'Request Book'.toUpperCase(),
                      color: ProjectColors.black,
                      size: 20.0 * ProjectStyle.kMultiplier * height,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
