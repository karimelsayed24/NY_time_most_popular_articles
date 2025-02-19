
import 'package:flutter/material.dart';

import '../../data/model/article_response.dart';
import 'article_list_item.dart';

class ArticleList extends StatelessWidget {
  const ArticleList({super.key, required this.response});
  final ArticleResponse response;
  @override
  Widget build(BuildContext context) {
    final articles = response.results;

    return articles.isEmpty
        ? const Center(child: Text('No articles found'))
        : ListView.separated(
            itemCount: articles.length,
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final article = articles[index];
              return ArticleListItem(article: article);
            },
          );
  }
}
