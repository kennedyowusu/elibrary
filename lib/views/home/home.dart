import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/constants/styles.dart';
import 'package:elibrary/controllers/streams/streams.dart';
import 'package:elibrary/model/streams.dart';
import 'package:elibrary/model/user.dart';
import 'package:elibrary/services/shared_prefs.dart';
import 'package:elibrary/views/details/details.dart';
import 'package:elibrary/views/home/components/books_by_streams.dart';
import 'package:elibrary/views/home/components/category.dart';
import 'package:elibrary/views/home/components/header.dart';
import 'package:elibrary/views/home/components/slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    Key? key,
    this.streams,
  }) : super(key: key);
  static const String routeName = '/home';
  final Streams? streams;

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  GlobalKey<FormState> _searchKey = GlobalKey<FormState>();
  TextEditingController _searchController = TextEditingController();

  CategoryCard _categoryCard = CategoryCard();
  StreamByBooks _streamByBooks = StreamByBooks(
    title: '',
  );
  final StreamsController _streamsController = Get.put(StreamsController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: ProjectStyle.padding(context),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Header(height: height),
                SizedBox(height: height * 0.018),
                buildSearchField(height),
                CarouselSlider(),
                SizedBox(height: height * 0.028),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "New Arrivals",
                      style: TextStyle(
                        color: ProjectColors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(
                        color: ProjectColors.black.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.014),
                Container(
                  height: height * 0.14,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _categoryCard.items.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: width * 0.02),
                        child: Image.asset(
                          _categoryCard.items[index],
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: height * 0.040),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Books by Streams",
                      style: TextStyle(
                        color: ProjectColors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(
                        color: ProjectColors.black.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.014),
                Container(
                  height: height * 0.285,
                  child: Obx(
                    () => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _streamsController.streamList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(right: width * 0.02),
                          child: GestureDetector(
                            onTap: () => Get.to(
                              () => DetailsScreen(
                                stream: _streamsController.streamList[index],
                              ),
                              arguments: [
                                _streamByBooks.books[index].title,
                                _streamsController
                                    .streamList[index].description,
                              ],
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  _streamByBooks.books
                                      .map((e) => e.image)
                                      .toList()[index],
                                  height: height * 0.25,
                                  width: width * 0.3,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(height: height * 0.007),
                                Text(
                                  _streamsController.streamList
                                      .map((element) => element.stream)
                                      .toList()[index]
                                      .toString(),
                                  style: TextStyle(
                                    color: ProjectColors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Form buildSearchField(double height) {
    return Form(
      key: _searchKey,
      child: SizedBox(
        height: height * 0.075,
        child: TextFormField(
          controller: _searchController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            labelText: 'Search',
            labelStyle: TextStyle(
              fontSize: height * 0.03,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(height * 0.02),
            ),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
      ),
    );
  }
}

class BookDetails extends StatelessWidget {
  const BookDetails({
    Key? key,
    required this.width,
    required this.height,
    required this.onTap,
  }) : super(key: key);

  final double width;
  final double height;
  final String image =
      "https://images.unsplash.com/photo-1495640388908-05fa85288e61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80";
  final String title = "Reading With Friends";
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Column(
        children: [
          Container(
            width: width * 0.3,
            height: height * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ProjectColors.grey,
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: height * 0.015),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: ProjectColors.black.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}
