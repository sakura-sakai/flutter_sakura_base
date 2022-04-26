import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sakura_base/presentation/route/router.dart';

import '../../../domain/entities/article.dart';
import '../../widgets/atom/image/image.dart';

class NewsDetailPage extends HookWidget {
  const NewsDetailPage({
    Key? key,
    @QueryParam('article') this.article,
  }) : super(key: key);

  final Article? article;

  @override
  Widget build(BuildContext context) {
    assert(article != null, "Article is required.");

    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: article!,
            child: networkImage(article?.urlImage),
          ),
        ),
        onTap: AppRouter().pop,
      ),
    );
  }
}
