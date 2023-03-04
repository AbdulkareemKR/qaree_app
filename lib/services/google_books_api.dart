import 'dart:convert';
import 'dart:developer';
import 'package:Qaree/models/Book_api/book_api/book_api.dart';
import 'package:Qaree/models/book/book.dart';
import 'package:Qaree/repos/book_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

Future<void> retrieveAllGoogleBooks() async {
  final maxResults = 40;
  var startIndex = 0;

  while (true) {
    final response = await http.get(
      Uri.parse('https://www.googleapis.com/books/v1/volumes'
          '?q=b&startIndex=$startIndex&maxResults=$maxResults'),
    );

    if (response.statusCode != 200) {
      print('Failed to retrieve books: ${response.body}');
      break;
    }

    final data = jsonDecode(response.body);

    if (data['totalItems'] == 0) {
      print('No more books to retrieve');
      break;
    }

    final books = data['items'] == null ? null : data['items'] as List<dynamic>;
    log(books.toString());

    if (books == null) break;
    List<Book> booksItems = [];
    final apiBooks =
        List<BookApi>.from((data["items"] as List<dynamic>).map<BookApi?>((x) {
      final bookApi = BookApi.fromJson(x);
      final repoBook = Book(
        id: bookApi.id,
        name: bookApi.volumeInfo?.title,
        isbn: [
          bookApi.volumeInfo?.industryIdentifiers?.first.identifier ?? "",
          bookApi.volumeInfo?.industryIdentifiers?.last.identifier ?? ""
        ],
        authors: bookApi.volumeInfo?.authors,
        bookType: bookApi.volumeInfo?.printType,
        description: bookApi.volumeInfo?.description,
        genres: bookApi.volumeInfo?.categories,
        language: bookApi.volumeInfo?.language,
        pages: bookApi.volumeInfo?.pageCount,
        publisher: bookApi.volumeInfo?.publisher,
        publishDate: parseDate(bookApi.volumeInfo?.publishedDate),
        rating: bookApi.volumeInfo?.averageRating,
        reviews: [],
        image: bookApi.volumeInfo?.imageLinks?.thumbnail,
      );
      booksItems.add(repoBook);

      return bookApi;
    }));

    log(apiBooks.toString());

    for (final repoBook in booksItems) {
      await BookRepo.addBook(book: repoBook);
    }

    startIndex += maxResults;

    if (startIndex >= data['totalItems']) {
      print('All books retrieved');
      break;
    }
  }
}

DateTime? parseDate(String? date) {
  if (date == null) {
    return null;
  } else if (date.length == 4) {
    return DateFormat("yyyy").parse(date);
  } else if (date.length == 7) {
    return DateFormat("yyyy-MM").parse(date);
  } else if (date.length == 10) {
    return DateFormat("yyyy-MM-dd").parse(date);
  }
}
