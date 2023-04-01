import 'package:network_state_management/data/model/book_model.dart';

class BookResponseModel {
  BookResponseModel({
    this.error,
    this.total,
    this.books,
  });

  final String? error;
  final String? total;
  final List<BookModel>? books;

  factory BookResponseModel.fromJson(Map<String, dynamic> json) =>
      BookResponseModel(
        error: json["error"],
        total: json["total"],
        books: json["books"] == null
            ? []
            : List<BookModel>.from(
                json["books"]!.map((x) => BookModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "total": total,
        "books": books == null
            ? []
            : List<dynamic>.from(books!.map((x) => x.toJson())),
      };
}
