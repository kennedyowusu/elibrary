import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/constants/styles.dart';
import 'package:elibrary/views/crud/post/post.dart';
import 'package:elibrary/views/home/components/books_by_streams.dart';
import 'package:elibrary/views/home/home.dart';
import 'package:elibrary/widgets/top_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewArrival extends StatefulWidget {
  NewArrival({Key? key}) : super(key: key);

  @override
  State<NewArrival> createState() => _NewArrivalState();
}

class _NewArrivalState extends State<NewArrival> {
  StreamByBooks _streamByBooks = StreamByBooks(
    title: '',
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          height: height * 0.08,
          width: width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: ProjectColors.primary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(height * 0.01),
              topRight: Radius.circular(height * 0.01),
            ),
          ),
          child: TextButton(
              onPressed: () {
                Get.to(() => BorrowBook());
              },
              child: Text(
                "Request Now",
                style: TextStyle(
                  color: ProjectColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              )),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: ProjectStyle.padding(context),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: buildTopSection(
                        width,
                        context,
                        CupertinoIcons.chevron_back,
                      ),
                    ),
                    Text(
                      "New Arrivals Details",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: ProjectColors.black,
                      ),
                    ),
                    Container(
                      width: width * 0.12,
                      height: MediaQuery.of(context).size.height * 0.06,
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.012),
                      decoration: BoxDecoration(
                        color: ProjectColors.primary,
                        borderRadius: BorderRadius.circular(height * 0.01),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.star,
                          color: ProjectColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.03),
                Container(
                  height: height * 0.4,
                  width: width,
                  decoration: BoxDecoration(
                    color: ProjectColors.white,
                    borderRadius: BorderRadius.circular(height * 0.01),
                  ),
                  child: FadeInImage(
                    placeholder: AssetImage(
                      "assets/image/biomedics.png",
                    ),
                    image: NetworkImage(
                      "https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: height * 0.03),
                Text(
                  "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. ",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    letterSpacing: 1,
                    wordSpacing: 1,
                    fontSize: 14,
                    color: ProjectColors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildTopSection(
    double width,
    BuildContext context,
    IconData icon,
  ) {
    return Container(
      alignment: Alignment.center,
      width: width * 0.12,
      height: MediaQuery.of(context).size.height * 0.06,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.012),
      decoration: BoxDecoration(
        color: ProjectColors.primary,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Icon(
        icon,
        color: ProjectColors.white,
      ),
    );
  }
}
