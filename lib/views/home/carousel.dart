import 'package:carousel_slider/carousel_slider.dart';
import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/constants/images.dart';
import 'package:elibrary/views/home/model.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:elibrary/controllers/book_controller.dart';
import 'package:get/get.dart';

class CarouselSlide extends StatelessWidget {
  CarouselSlide({Key? key, required this.didSelected}) : super(key: key);
  // final List homeModel;
  final Function(int index) didSelected;
  final BookController bookController = Get.put(BookController());

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < bookController.bookList.length; i++) {
      if (bookController.bookList[i].isAvailable == true) {
        debugPrint("Available Books are: ${bookController.bookList[i].title}");
      }
    }
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.width * 0.96 * 9 / 16,
        aspectRatio: 16 / 9,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
      ),
      items: bookController.bookList.map((element) {
        final index = bookController.bookList.indexOf(element);
        final item = bookController.bookList[index];
        debugPrint(bookController.bookList[index].author);
        return GestureDetector(
          // onTap: () => didSelected(index),
          onTap: () {
            debugPrint(bookController.bookList[index].author);
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
            decoration: BoxDecoration(color: Colors.transparent),
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)],
                    child: Image.asset(
                      // item.image.toString(),
                      ProjectImages.biomedics,
                      fit: BoxFit.contain,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 170,
                  child: Container(
                    width: 140,
                    height: 22,
                    padding: EdgeInsets.only(right: 50),
                    decoration: BoxDecoration(
                      color: ProjectColors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        item.author.toString(),
                        style: TextStyle(
                          fontSize: 12,
                          color: ProjectColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
