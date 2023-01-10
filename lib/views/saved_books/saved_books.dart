import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/constants/images.dart';
import 'package:elibrary/constants/styles.dart';
import 'package:elibrary/views/home/components/nav_drawer.dart';
import 'package:elibrary/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class SavedBooksView extends StatelessWidget {
  SavedBooksView({super.key});
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
        drawer: NavDrawer(),
        body: Padding(
          padding: ProjectStyle.padding(context),
          child: SizedBox(
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
                    height: 90,
                    width: 100,
                    decoration: BoxDecoration(
                        color: ProjectColors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        leading: Container(
                          margin: EdgeInsets.symmetric(),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(ProjectImages.logo),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Image.asset(
                            ProjectImages.logo,
                            height: 100,
                            width: 100,
                          ),
                        ),
                        title: Text(
                          'Book Title Goes Here',
                          style: TextStyle(
                            color: ProjectColors.black,
                            fontSize: 25.0 * ProjectStyle.kMultiplier * width,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          'Author Name',
                          style: TextStyle(
                            color: ProjectColors.black,
                            fontSize: 20.0 * ProjectStyle.kMultiplier * width,
                          ),
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            debugPrint('${i + 1} is deleted');
                          },
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: ProjectColors.white,
                            child: Icon(
                              Icons.delete,
                              color: ProjectColors.red,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
