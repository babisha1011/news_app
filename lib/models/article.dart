class Article {
  final String title;
  final String description;
  final String urlToImage;
  final String publishedAt;
  final String url;
  final String content;

  Article({
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.publishedAt,
    required this.url,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? "No Title",
      description: json['description'] ?? "No Description",
      urlToImage: json['urlToImage'] ??
          'https://via.placeholder.com/150', // fallback image
      publishedAt: json['publishedAt'] ?? "Unknown Date",
      url: json['url'] ?? "",
      content: json['content'] ?? "No Content",
    );
  }
}
