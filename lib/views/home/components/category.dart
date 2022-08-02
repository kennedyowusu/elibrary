import 'package:elibrary/constants/images.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({Key? key}) : super(key: key);

  List items = [
    ProjectImages.principlesofecons,
    ProjectImages.cs1,
    ProjectImages.biomedics,
    ProjectImages.og,
    ProjectImages.medicine,
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.3,
      height: height * 0.5,
    );
  }
}
