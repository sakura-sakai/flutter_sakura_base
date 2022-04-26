import 'package:equatable/equatable.dart';

import 'article.dart';

class News extends Equatable {
  const News({
    required this.articles,
  });

  final List<Article> articles;

  @override
  List<Object?> get props => [articles];

  @override
  bool? get stringify => true;
}
