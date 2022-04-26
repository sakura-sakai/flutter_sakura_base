import '../../domain/entities/article.dart';
import 'source_model.dart';

class ArticleModel extends Article {
  const ArticleModel({
    String? title,
    this.source,
    this.author,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  }) : super(
          title: title ?? "",
          urlImage: urlToImage ?? "",
        );

  final SourceModel? source;
  final String? author;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      source: SourceModel.fromJson(json['source']),
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'source': source,
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
    };
  }

  static List<ArticleModel> listFromJson(dynamic json) {
    if (json is! List || json.isEmpty) {
      return <ArticleModel>[];
    }

    return json.map<ArticleModel>((e) {
      return ArticleModel.fromJson(e);
    }).toList();
  }
}
