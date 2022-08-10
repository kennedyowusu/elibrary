import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/constants/styles.dart';
import 'package:elibrary/views/new_arrival/component/book_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewArrivalList extends StatefulWidget {
  @override
  State<NewArrivalList> createState() => _NewArrivalListState();
}

class _NewArrivalListState extends State<NewArrivalList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Padding(
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
                    "New Books Details",
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
                height: height * 0.85,
                child: ListView.separated(
                  itemCount: 7,
                  separatorBuilder: (context, index) => SizedBox(
                    height: height * 0.028,
                  ),
                  itemBuilder: ((context, index) => BookCard()),
                ),
              ),
            ],
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
