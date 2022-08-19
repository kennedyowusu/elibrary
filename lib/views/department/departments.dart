import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/constants/styles.dart';
import 'package:elibrary/controllers/department/department.dart';
import 'package:elibrary/model/department.dart';
import 'package:elibrary/views/home/components/books_by_streams.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllDepartmentsView extends StatefulWidget {
  AllDepartmentsView({Key? key, Department? department}) : super(key: key);

  @override
  State<AllDepartmentsView> createState() => _AllDepartmentsViewState();
}

class _AllDepartmentsViewState extends State<AllDepartmentsView> {
  DepartmentController departmentController = Get.put(DepartmentController());
  StreamByBooks _streamByBooks = StreamByBooks(
    title: '',
  );

  Department department = Department(
    name: '',
    stream: '',
    description: '',
    author: '',
    availability: true,
    hod: '',
    totalNoBooks: 0,
  );

  @override
  void initState() {
    department.name = department.name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    debugPrint(departmentController.departmentList.length.toString());
    // Print department name
    debugPrint(department.name);
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
                        Icons.chevron_left,
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
                  itemCount: departmentController.departmentList.length,
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
                                // ProjectImages.medicine,
                                // departmentController.departmentList[index].image,
                                _streamByBooks.books
                                    .map((e) => e.image)
                                    .toList()[index],
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
                                  departmentController
                                      .departmentList[index].name,
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
                                  departmentController
                                      .departmentList[index].hod,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: ProjectColors.black,
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
                                // department != null ? Text(
                                //   department!.name,
                                //   style: TextStyle(
                                //     fontSize: 14,
                                //     color: ProjectColors.primary,
                                //     fontWeight: FontWeight.w500,
                                //   ),
                                // ) : Text(
                                //   'No name available',
                                //   style: TextStyle(
                                //     fontSize: 14,
                                //     color: ProjectColors.primary,
                                //     fontWeight: FontWeight.w500,
                                //   ),
                                // ),
                                Text(
                                  departmentController
                                      .departmentList[index].totalNoBooks
                                      .toInt()
                                      .toString(),
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
