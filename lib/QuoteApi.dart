import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class QuoteApi {
  Future<Quote> fetchQuote() async {
    final response = await http.get(Uri.parse('https://api.quotable.io/random'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return Quote.fromJson(data);
    } else {
      throw Exception('Failed to load a random quote');
    }
  }
}

class Quote {
  final String content;
  final String author;

  Quote({required this.content, required this.author});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      content: json['content'],
      author: json['author'],
    );
  }

  void printQuote() {
    print('Quote: $content');
    print('Author: $author');
  }
}
