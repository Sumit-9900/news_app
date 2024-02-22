class NewsModel {
  const NewsModel({
    required this.sourceName,
    required this.title,
    required this.des,
    required this.url,
    required this.urlToImage,
    required this.content,
  });
  final String sourceName;
  final String title;
  final String des;
  final String url;
  final String urlToImage;
  final String content;

  static NewsModel fromApitoApp(Map<String, dynamic> article) {
    return NewsModel(
      sourceName: article['source']['name'] ?? '---',
      title: article['title'] ?? '---',
      des: article['description'] ?? '---',
      url: article['url'] ?? 'https://www.google.co.in/',
      urlToImage: article['urlToImage'] ?? 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fpredoc.org%2Fopportunities&psig=AOvVaw0YShIa7EaD7nxepAXxUi66&ust=1708672611519000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCMCC2NKzvoQDFQAAAAAdAAAAABAF',
      content: article['content'] ?? '---',
    );
  }
}
