import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/model/department.dart';
import 'package:elibrary/views/crud/post/post.dart';
import 'package:elibrary/views/home/components/books_by_streams.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookDetails extends StatefulWidget {
  BookDetails({
    Key? key,
    required this.height,
    required this.width,
    required this.icon,
    required this.department,
  }) : super(key: key);

  final double height;
  final double width;
  final IconData icon;

  final Department department;

  final StreamByBooks streamByBooks = Get.put(StreamByBooks(
    title: '',
  ));

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
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
                  image: AssetImage(
                    widget.streamByBooks.books[index].image,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: widget.height * 0.02),
            Text(
              widget.department.name.toUpperCase(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: ProjectColors.black.withOpacity(0.5),
              ),
            ),
            SizedBox(height: widget.height * 0.02),
            Text(
              widget.department.description,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16,
                color: ProjectColors.black.withOpacity(0.5),
              ),
            ),
            SizedBox(height: widget.height * 0.02),
            Text(
              widget.department.author,
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
            SizedBox(height: widget.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.department.availability.toString() == "true"
                      ? "Available"
                      : "Not Available",
                  style: TextStyle(
                    fontSize: 16,
                    color: ProjectColors.black.withOpacity(0.5),
                  ),
                ),
                Icon(
                  widget.department.availability.toString() == "true"
                      ? Icons.check_circle
                      : Icons.cancel,
                  color: widget.department.availability.toString() == "true"
                      ? ProjectColors.green
                      : ProjectColors.red,
                ),
              ],
            ),
            SizedBox(height: widget.height * 0.02),
            widget.department.availability.toString() == "true"
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
