import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/controllers/streams/streams.dart';
import 'package:elibrary/model/streams.dart';
import 'package:elibrary/views/crud/post/post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookDetails extends StatefulWidget {
  BookDetails({
    Key? key,
    required this.height,
    required this.width,
    required this.icon,
    required this.stream,
  }) : super(key: key);

  final double height;
  final double width;
  final IconData icon;

  final Streams stream;

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height * 0.80,
      child: ListView.separated(
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: 1,
        shrinkWrap: true,
        separatorBuilder: (context, index) => SizedBox(
          height: widget.height * 0.02,
        ),
        itemBuilder: (context, index) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: widget.height * 0.4,
              width: widget.width,
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
            SizedBox(height: widget.height * 0.02),
            Text(
              widget.stream.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: ProjectColors.black.withOpacity(0.5),
              ),
            ),
            SizedBox(height: widget.height * 0.02),
            Text(
              widget.stream.description,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16,
                color: ProjectColors.black.withOpacity(0.5),
              ),
            ),
            SizedBox(height: widget.height * 0.02),
            Text(
              widget.stream.author,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: ProjectColors.black.withOpacity(0.5),
              ),
            ),
            SizedBox(height: widget.height * 0.02),
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
                  widget.stream.availability.toString() == "true"
                      ? "Available"
                      : "Not Available",
                  style: TextStyle(
                    fontSize: 16,
                    color: ProjectColors.black.withOpacity(0.5),
                  ),
                ),
                Icon(
                  widget.stream.availability.toString() == "true"
                      ? Icons.check_circle
                      : Icons.cancel,
                  color: widget.stream.availability.toString() == "true"
                      ? ProjectColors.green
                      : ProjectColors.red,
                ),
              ],
            ),
            SizedBox(height: widget.height * 0.02),
            widget.stream.availability.toString() == "true"
                ? ElevatedButton.icon(
                    onPressed: () {
                      Get.to(() => BorrowBook());
                    },
                    icon: Icon(Icons.add),
                    label: Text("Borrow Book"),
                  )
                : Container(
                    child: Text(""),
                  ),
            SizedBox(height: widget.height * 0.02),
          ],
        ),
      ),
    );
  }
}
