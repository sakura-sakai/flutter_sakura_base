import '../../core/exceptions/exceptions.dart';
import '../../domain/entities/news.dart';
import '../../domain/entities/news_request.dart';
import '../../domain/repositories/news_repository.dart';
import '../sources/remote/news_remote.dart';

class NewsRepositoryImpl implements NewsRepository {
  NewsRepositoryImpl([NewsRemote? remote]) : _remote = remote ?? NewsRemote();

  final NewsRemote _remote;

  @override
  Future<News> getNews(NewsRequest request) async {
    try {
      return await _remote.getNews(request);
    } catch (e) {
      throw GenericException.handler(e);
    }
  }
}
