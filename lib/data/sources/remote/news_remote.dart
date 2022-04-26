import 'package:flutter_sakura_base/data/models/news_model.dart';
import 'package:flutter_sakura_base/domain/entities/news_request.dart';

import '../../../core/exceptions/exceptions.dart';
import '../../../core/services/api/api.dart';

class NewsRemote {
  NewsRemote([ApiClient? client]) : _client = client ?? ApiClient();

  final ApiClient _client;

  Future<NewsModel> getNews(NewsRequest request) async {
    try {
      final response = await _client.invokeAPI(
        '/v2/everything',
        apiMethod: ApiMethod.get,
        queryParameters: request.toMap(),
      );

      return NewsModel.fromJson(response.data!);
    } catch (e) {
      throw GenericException.handler(e);
    }
  }
}
