import '../entities/news.dart';
import '../entities/news_request.dart';

abstract class NewsRepository {
  Future<News> getNews(NewsRequest request);
}
