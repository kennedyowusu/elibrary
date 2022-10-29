import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/constants/styles.dart';
import 'package:elibrary/views/home/components/nav_drawer.dart';
import 'package:elibrary/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class BorrowedBooksView extends StatelessWidget {
  BorrowedBooksView({super.key});
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
        body: SizedBox(
          child: ListView(
            children: [
              SizedBox(
                height: 5.0 * ProjectStyle.kMultiplier * height,
              ),
              for (int i = 0; i < 10; i++)
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20.0 * ProjectStyle.kMultiplier * width,
                    vertical: 10.0 * ProjectStyle.kMultiplier * height,
                  ),
                  height: 100,
                  width: 100,
                  color: Colors.teal,
                )
            ],
          ),
        ),
      ),
    );
  }
}
