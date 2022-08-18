import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/views/details/details.dart';
import 'package:elibrary/views/home/components/books_by_streams.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchItems extends SearchDelegate {
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
    return Text("$query");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text('Searching...'),
    );
  }
}
