import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/views/details/details.dart';
import 'package:elibrary/views/home/components/books_by_streams.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookCard extends StatelessWidget {
  BookCard({Key? key}) : super(key: key);

  StreamByBooks _streamByBooks = StreamByBooks(
    title: '',
  );

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            // Get.to(() => DetailsScreen();
          },
          child: Container(
            height: height * 0.2,
            width: width,
            decoration: BoxDecoration(
              color: ProjectColors.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  _streamByBooks.books[0].image,
                  alignment: Alignment.centerLeft,
                  height: height * 0.3,
                  width: width * 0.3,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  width: width * 0.010,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.035),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BookDetails(
                        deptName: 'Biomedical Engineering',
                        description:
                            "It is a long established fact that a \n reader will be distracted by the  \n content of a page when looking at \n ts layout.",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class BookDetails extends StatelessWidget {
  const BookDetails({
    Key? key,
    required this.deptName,
    required this.description,
  }) : super(key: key);
  final String deptName, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          deptName,
          style: TextStyle(
            color: ProjectColors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          description,
          textAlign: TextAlign.justify,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 14.0,
            color: ProjectColors.white,
          ),
        ),
      ],
    );
  }
}
