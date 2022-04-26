import 'dart:math';

import 'package:flutter_sakura_base/core/utils/extensions/date_time.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entities/news.dart';
import '../../../domain/entities/news_request.dart';
import '../../../domain/usecases/get_news_use_case.dart';
import '../view_model.dart';

final newsViewModelProvider = ChangeNotifierProvider(
  (ref) => NewsViewModel(ref.read),
);

class NewsViewModel extends ViewModel {
  NewsViewModel(Reader reader) : super(reader);

  final GetNewsUseCase _getNewUC = GetNewsUseCase();

  AsyncValue<News> news = const AsyncLoading();

  Future<void> fetchNews() async {
    try {
      final params = NewsRequest(
        query: ['anim', 'manga'][Random().nextInt(2)],
        from: DateTime.now()
            .subtract(
              const Duration(days: 28),
            )
            .formatYYYYMMdd(),
      );

      final newsData = await _getNewUC.call(params: params);

      news = AsyncData(newsData);
    } catch (e) {
      news = AsyncError(e);
      handleExceptions(e);
    }

    updateState();
  }
}
