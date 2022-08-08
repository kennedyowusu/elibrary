import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/constants/images.dart';
import 'package:elibrary/constants/styles.dart';
import 'package:flutter/material.dart';

class AllDepartmentsView extends StatelessWidget {
  const AllDepartmentsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: height * 0.160,
              decoration: BoxDecoration(
                color: ProjectColors.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: ProjectColors.white,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      icon: Icon(
                        Icons.search,
                        color: ProjectColors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Positioned(
                    top: 45,
                    left: 0,
                    child: Container(
                      height: height * 0.060,
                      width: width * 0.9,
                      decoration: BoxDecoration(
                        color: ProjectColors.white,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(height * 0.030),
                          topRight: Radius.circular(height * 0.030),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Departments',
                          style: TextStyle(
                            color: ProjectColors.primary,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.020,
            ),
            Container(
              height: height * 0.760,
              child: Padding(
                padding: ProjectStyle.padding(context),
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: height * 0.0,
                    );
                  },
                  itemCount: 5,
                  itemBuilder: (context, index) => Container(
                    height: 200,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 40,
                          left: 20,
                          child: Material(
                            child: Container(
                              height: 120.0,
                              width: width * 0.9,
                              decoration: BoxDecoration(
                                color: ProjectColors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: ProjectColors.grey.withOpacity(0.3),
                                    blurRadius: 8.0,
                                    spreadRadius: 0.0,
                                    offset: Offset(-10.0, 10.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Card(
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            shadowColor: ProjectColors.grey.withOpacity(0.5),
                            child: Container(
                              height: 140.0,
                              width: width * 0.26,
                              decoration: BoxDecoration(
                                color: ProjectColors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Image.asset(
                                ProjectImages.medicine,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 40.0,
                          left: 140.0,
                          child: Container(
                            height: 140.0,
                            width: width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Biomedical Engineering',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: ProjectColors.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  'Dr. A.K.M. Ali',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: ProjectColors.primary,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 20.0),
                                  child: Divider(
                                    color: ProjectColors.grey,
                                    thickness: 1,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "A total of 10 Departments",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: ProjectColors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
