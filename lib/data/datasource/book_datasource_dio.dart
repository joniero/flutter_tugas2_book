import 'package:dio/dio.dart';
import 'package:network_state_management/constants/constants.dart';
import 'package:network_state_management/data/model/book_response_model.dart';

class BookDatasourceDio {
  final Dio _client = Dio();

  Future<BookResponseModel> getBooks() async {
    try {
      final urlPath = Constants.allNewBook;

      final response = await _client.get(urlPath);

      if (response.statusCode == 200) {
        return BookResponseModel.fromJson(response.data);
      }

      return BookResponseModel();
    } catch (e) {
      rethrow;
    }
  }
}
