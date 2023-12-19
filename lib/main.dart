import 'QuoteApi.dart';

void main() async {
  final quoteApi = QuoteApi();
  try {
    final quote = await quoteApi.fetchQuote();
    quote.printQuote();
  } catch (e) {
    print('Error: $e');
  }
}
