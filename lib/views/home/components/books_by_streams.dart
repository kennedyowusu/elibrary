import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/constants/images.dart';
import 'package:flutter/material.dart';

class StreamByBooks extends StatelessWidget {
  StreamByBooks({Key? key, required this.title}) : super(key: key);

  final String title;

  List<Books> books = [
    Books(
      title: 'Computer Science',
      image: ProjectImages.cs1,
    ),
    Books(
      title: 'Biomedical',
      image: ProjectImages.biomedics,
    ),
    Books(
      title: 'Medicine',
      image: ProjectImages.medicine,
    ),
    Books(
      title: 'Oil & Gas',
      image: ProjectImages.og,
    ),
    Books(
      title: 'Economics',
      image: ProjectImages.principlesofecons,
    ),
    Books(
      title: 'Oil & Gas',
      image: ProjectImages.og,
    ),
    Books(
      title: 'Economics',
      image: ProjectImages.principlesofecons,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          width: width * 0.3,
          height: height * 0.5,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            elevation: 2,
          ),
        ),
      ],
    );
  }
}

class Books {
  String title;
  String image;

  Books({required this.title, required this.image});
}
