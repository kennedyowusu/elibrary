import 'dart:convert';
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
        debugPrint("The response from the API is: ${bookResponse.bodyString}");
        bookList.assignAll(
          bookResponse.bodyString != null
              ? bookFromJson(bookResponse.bodyString ?? '')
              : [],
        );
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
      debugPrint(
        e.toString(),
      );
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
