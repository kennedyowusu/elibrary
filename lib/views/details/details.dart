import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/constants/styles.dart';
import 'package:elibrary/controllers/details/details.dart';
import 'package:elibrary/model/streams.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/book_details.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({Key? key, required this.stream}) : super(key: key);

  Details details = Get.put(Details());

  final Streams stream;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: ProjectStyle.padding(context),
          child: SingleChildScrollView(
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
                      "Brief Details",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: ProjectColors.black,
                      ),
                    ),
                    buildTopSection(
                      width,
                      context,
                      CupertinoIcons.book_circle,
                    ),
                  ],
                ),
                SizedBox(height: height * 0.02),
                Container(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: 1,
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => SizedBox(
                      height: height * 0.02,
                    ),
                    itemBuilder: (context, index) {
                      return BookDetails(
                        height: height,
                        width: width,
                        icon: details.isAvailable == false
                            ? (Icons.check_circle_outline_outlined)
                            : (Icons.cancel_outlined),
                        // stream: stream,
                      );
                    },
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
