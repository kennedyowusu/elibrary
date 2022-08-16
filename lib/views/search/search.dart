import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/controllers/streams/streams.dart';
import 'package:elibrary/views/details/details.dart';
import 'package:elibrary/views/home/components/books_by_streams.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchItems extends SearchDelegate {
  final StreamsController _streamsController = Get.put(StreamsController());
  StreamByBooks _streamByBooks = StreamByBooks(
    title: '',
  );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.chevron_left),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Obx(
      () => ListView.builder(
        scrollDirection: Axis.vertical,
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
                  _streamsController.streamList[index].description,
                ],
              ),
              // child: Card(
              //   child: ListTile(
              //     title: Text(
              //       _streamsController.streamList
              //           .map((element) => element.stream)
              //           .toList()[index]
              //           .toString(),
              //       style: TextStyle(
              //         color: ProjectColors.black,
              //       ),
              //     ),
              //     subtitle: Text(
              //       _streamByBooks.books.map((e) => e.title).toList()[index],
              //       style: TextStyle(
              //         color: ProjectColors.black,
              //       ),
              //     ),
              //     leading: Image.asset(
              //       _streamByBooks.books.map((e) => e.image).toList()[index],
              //       height: height * 0.25,
              //       width: width * 0.3,
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
              child: Column(
                children: [
                  Image.asset(
                    _streamByBooks.books.map((e) => e.image).toList()[index],
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
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text('Searching...'),
    );
  }
}
