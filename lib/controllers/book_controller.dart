import 'dart:io';

import 'package:elibrary/model/books.dart';
import 'package:elibrary/services/repository/book_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookController extends GetxController {
  BookRepository bookRepository = BookRepository();

  RxBool isLoading = false.obs;
  RxList<Book> bookList = <Book>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchBooksList();
  }

  Future<void> fetchBooksList() async {
    isLoading(true);

    try {
      Response bookResponse = await bookRepository.fetchBooks();
      if (bookResponse.statusCode == 200) {
        debugPrint('The response body is: ${bookResponse.body}');

        debugPrint(
          "The Content of incoming books response is = ${bookResponse.bodyString}",
        );

        Map<String, dynamic> bookMap = bookResponse.body;

        bookMap.forEach((key, value) {
          debugPrint("Book Key is = $key, Book Value is $value");
        });

        bookList = [] as RxList<Book>;
        for (var element in bookResponse.body) {
          bookList.add(Book.fromJson(element));
        }
        debugPrint('Total Book List is: ${bookList.length}');
      } else {
        Get.snackbar(
          'Error Occurred',
          bookResponse.statusText.toString(),
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
      }
    } on SocketException {
      GetSnackBar(
        message: "No Internet Connectivity",
        duration: Duration(seconds: 5),
      ).show();
    } catch (e) {
      Get.snackbar(
        "Error Occurred",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.green,
        duration: Duration(seconds: 5),
      ).show();
    } finally {
      isLoading(false);
    }
  }
}
