import '../../core/exceptions/exceptions.dart';
import '../../data/repositories/news_repository_impl.dart';
import '../entities/news.dart';
import '../entities/news_request.dart';
import '../repositories/news_repository.dart';
import 'use_case.dart';

class GetNewsUseCase implements UseCase<News, NewsRequest> {
  GetNewsUseCase([
    NewsRepository? repository,
  ]) : _repository = repository ?? NewsRepositoryImpl();

  final NewsRepository _repository;

  @override
  Future<News> call({required NewsRequest params}) async {
    try {
      return await _repository.getNews(params);
    } catch (e) {
      throw GenericException.handler(e);
    }
  }
}
