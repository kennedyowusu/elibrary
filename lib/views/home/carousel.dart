import 'package:carousel_slider/carousel_slider.dart';
import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/constants/images.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:elibrary/controllers/book_controller.dart';
import 'package:get/get.dart';

class CarouselSlide extends StatelessWidget {
  CarouselSlide({Key? key, required this.didSelected}) : super(key: key);
  final Function(int index) didSelected;
  final BookController bookController = Get.put(BookController());

  @override
  Widget build(BuildContext context) {
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
        final availableBookAuthor =
            bookController.bookList[index].isAvailable == true
                ? bookController.bookList[index]
                : bookController.bookList[Random().nextInt(10)];

        for (int i = 0; i < bookController.bookList.length; i++) {
          if (bookController.bookList[i].isAvailable == true) {
            debugPrint(
              "Authors with books available Books are: ${availableBookAuthor.author}, and the book title is ${availableBookAuthor.title}",
            );
          }
        }
        return GestureDetector(
          onTap: () {
            debugPrint(availableBookAuthor.author);
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
            decoration: BoxDecoration(color: Colors.transparent),
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    child: Image.asset(
                      // availableBookAuthor.image.toString(),
                      ProjectImages.biomedics,
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width,
                      // height: MediaQuery.of(context).size.width * 0.96 * 9 / 16,
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
                        availableBookAuthor.author.toString(),
                        style: TextStyle(
                          fontSize: 12,
                          color: ProjectColors.white,
                          fontWeight: FontWeight.normal,
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
