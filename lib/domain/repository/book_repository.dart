import 'package:network_state_management/data/model/book_response_model.dart';

import '../../data/model/book_model.dart';

abstract class BookRepository {
  Future<BookResponseModel> getAllNewBook(String query);

  Future<BookResponseModel> searchBookByName(String query);

  Future<BookModel> getDetailBook(String isbn);
}
