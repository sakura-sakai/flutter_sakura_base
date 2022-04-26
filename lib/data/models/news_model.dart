import '../../domain/entities/news.dart';
import 'article_model.dart';

class NewsModel extends News {
  const NewsModel({
    required List<ArticleModel> articles,
    required this.status,
    required this.totalResults,
  }) : super(articles: articles);

  final String status;
  final int totalResults;

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      status: json['status'],
      totalResults: json['totalResults'],
      articles: ArticleModel.listFromJson(json['articles']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'totalResults': totalResults,
      'articles': articles,
    };
  }
}
