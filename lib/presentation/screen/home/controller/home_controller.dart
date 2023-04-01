import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:network_state_management/data/model/book_model.dart';
import 'package:network_state_management/data/repository/book_repository_impl.dart';
import 'package:network_state_management/domain/repository/book_repository.dart';

class HomeController extends GetxController {
  final BookRepository _repository = BookRepositoryImpl();

  Rx<List<BookModel>> listOfBooks = Rx([]);
  Rx<TextEditingController> searchController = Rx(TextEditingController());

  void getBooks() async {
    final response = await _repository.getAllNewBook('');
    listOfBooks(response.books);

    update();
  }

  void searchByText(String input) async {
    if (input.isEmpty) {
      getBooks();
    } else {
      final response = await _repository.searchBookByName(input);
      listOfBooks(response.books);

      update();
    }
  }
}
