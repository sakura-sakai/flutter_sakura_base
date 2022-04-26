import 'package:equatable/equatable.dart';

class Article extends Equatable {
  const Article({
    required this.title,
    required this.urlImage,
  });

  final String title;
  final String urlImage;

  @override
  List<Object?> get props => [
        title,
        urlImage,
      ];

  @override
  bool? get stringify => true;
}
