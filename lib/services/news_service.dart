import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article.dart';

class NewsService {
  static const String _apiKey = '';
  static const String _baseUrl =
      'https://newsapi.org/v2/top-headlines?country=in&apiKey=$_apiKey';

 static Future<List<Article>> fetchArticles([String? query]) async {
  final String url = query == null || query.isEmpty
      ? 'https://newsapi.org/v2/top-headlines?country=in&apiKey=$_apiKey'
      : 'https://newsapi.org/v2/everything?q=$query&sortBy=publishedAt&apiKey=$_apiKey';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    final List articles = jsonData['articles'];
    return articles.map((json) => Article.fromJson(json)).toList();
  } else {
    throw Exception('Failed to fetch articles');
  }
}

}
