// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:elibrary/controllers/book_controller.dart';
import 'package:elibrary/model/books.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/constants/images.dart';
import 'package:elibrary/constants/styles.dart';
import 'package:elibrary/routes/routes.dart';
import 'package:elibrary/utils/helper.dart';
import 'package:elibrary/views/home/components/nav_drawer.dart';
import 'package:elibrary/widgets/app_bar.dart';
import 'package:elibrary/widgets/medium.dart';

class DetailScreen extends StatelessWidget {
  final int screenId;

  DetailScreen({
    Key? key,
    required this.screenId,
  }) : super(key: key);
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Book incomingBookDetails = Get.find<BookController>().bookList[screenId];

    debugPrint(
        "The incoming book details are: ${incomingBookDetails.title}, ${incomingBookDetails.author}, ${incomingBookDetails.image}, ${incomingBookDetails.isAvailable}");

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
                    fit: BoxFit.contain,
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
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${incomingBookDetails.title}",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize:
                                  18.0 * ProjectStyle.kMultiplier * height,
                              color: ProjectColors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          incomingBookDetails.isAvailable!
                              ? IsAvailableContainer(
                                  backgroundColor: ProjectColors.green,
                                  height,
                                  iconColor: ProjectColors.white,
                                  size:
                                      20.0 * ProjectStyle.kMultiplier * height,
                                  Icons.check_box_sharp,
                                )
                              : IsAvailableContainer(
                                  height,
                                  backgroundColor: ProjectColors.red,
                                  iconColor: ProjectColors.white,
                                  size:
                                      20.0 * ProjectStyle.kMultiplier * height,
                                  Icons.cancel_sharp,
                                ),
                        ],
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
                "${incomingBookDetails.description}",
                style: appStyle(
                  size: 16.0 * ProjectStyle.kMultiplier * height,
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

  CircleAvatar IsAvailableContainer(double height, IconData icon,
      {double? size, Color? backgroundColor, Color? iconColor}) {
    return CircleAvatar(
      radius: 15.0,
      backgroundColor: backgroundColor,
      child: Icon(
        icon,
        color: iconColor,
        size: size,
      ),
    );
  }
}
