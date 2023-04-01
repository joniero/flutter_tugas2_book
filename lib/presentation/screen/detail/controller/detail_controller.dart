import 'package:get/get.dart';
import 'package:network_state_management/data/model/book_model.dart';

import '../../../../data/repository/book_repository_impl.dart';
import '../../../../domain/repository/book_repository.dart';

class DetailController extends GetxController {
  final BookRepository _repository = BookRepositoryImpl();

  Rx<BookModel> book = Rx(BookModel());
  void getDetail(String isbn13) async {
    final response = await _repository.getDetailBook(isbn13);
    book(response);
  }
}
