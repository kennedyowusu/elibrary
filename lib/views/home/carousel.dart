import 'package:carousel_slider/carousel_slider.dart';
import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/views/home/model.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class CarouselSlide extends StatelessWidget {
  CarouselSlide({Key? key, required this.didSelected}) : super(key: key);
  // final List homeModel;
  final Function(int index) didSelected;

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
      items: homeModel.map((element) {
        final index = homeModel.indexOf(element);
        final item = homeModel.elementAt(index);
        return GestureDetector(
          onTap: () => didSelected(index),
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
                      item.image,
                      fit: BoxFit.contain,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 150,
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
                        item.authorName.toString(),
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
