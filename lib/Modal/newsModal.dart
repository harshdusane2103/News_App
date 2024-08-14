class NewsModal {
  late List<Articles> articles;

  NewsModal({required this.articles});

  factory NewsModal.formJson(Map m1) {
    return NewsModal(
        articles: (m1['articles'] as List)
            .map(
              (e) => Articles.formJson(e),
            )
            .toList());
  }
}

class Articles {
  late Source source;
  late String author, title, description, url, publishedAt, content, urlToImage;

  Articles(
      {required this.source,
      required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.publishedAt,
      required this.urlToImage,
      required this.content});

  factory Articles.formJson(Map m1) {
    return Articles(
        source: Source.formJson(m1['source'] ?? 'Not Found'),
        author: m1['author'] ??'Not Found',
        title: m1['title']??'Not Found',
        description: m1['description']??'Not Found',
        url: m1['url']??'',
        publishedAt: m1['publishedAt']??'Not Found',
        content: m1['content']??'Not Found',
        urlToImage: m1['urlToImage'] ?? 'Not Found');
  }
}

class Source {
  late String name;

  Source({required this.name});

  factory Source.formJson(Map m1) {
    return Source(name: m1['name'] ?? 'Not Found');
  }
}
