import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/controllers/streams/streams.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookDetails extends StatelessWidget {
  BookDetails({
    Key? key,
    required this.height,
    required this.width,
    required this.icon,
  }) : super(key: key);

  final double height;
  final double width;
  final IconData icon;

  final data = Get.arguments;

  final StreamsController _streamsController = Get.put(StreamsController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: height * 0.4,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ProjectColors.white,
            image: DecorationImage(
              image: NetworkImage(
                "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: height * 0.02),
        Text(
          _streamsController.streamList[data].title!,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: ProjectColors.black.withOpacity(0.5),
          ),
        ),
        SizedBox(height: height * 0.02),
        Text(
          _streamsController.streamList[data].description!,
          style: TextStyle(
            fontSize: 16,
            color: ProjectColors.black.withOpacity(0.5),
          ),
        ),
        SizedBox(height: height * 0.02),
        Text(
          _streamsController.streamList[data].author!,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: ProjectColors.black.withOpacity(0.5),
          ),
        ),
        SizedBox(height: height * 0.02),
        Text(
          "Edition",
          style: TextStyle(
            fontSize: 16,
            color: ProjectColors.black.withOpacity(0.5),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _streamsController.streamList[data].availability!.toString(),
              style: TextStyle(
                fontSize: 16,
                color: ProjectColors.black.withOpacity(0.5),
              ),
            ),
            Icon(icon),
          ],
        ),
      ],
    );
  }
}
