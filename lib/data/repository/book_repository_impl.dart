import 'package:network_state_management/data/datasource/book_datasource_dio.dart';
import 'package:network_state_management/data/datasource/book_datasource_http.dart';
import 'package:network_state_management/data/model/book_model.dart';
import 'package:network_state_management/data/model/book_response_model.dart';
import 'package:network_state_management/domain/repository/book_repository.dart';

class BookRepositoryImpl implements BookRepository {
  final BookDatasourceDio _datasourceDio = BookDatasourceDio();
  final BookDatasourceHttp _datasourceHttp = BookDatasourceHttp();

  @override
  Future<BookResponseModel> getAllNewBook(String query) async =>
      await _datasourceHttp.getBooks(query);

  @override
  Future<BookResponseModel> searchBookByName(String query) async =>
      await _datasourceHttp.searchBooks(query);

  @override
  Future<BookModel> getDetailBook(String isbn) async =>
    await _datasourceHttp.getDetail(isbn);
}
