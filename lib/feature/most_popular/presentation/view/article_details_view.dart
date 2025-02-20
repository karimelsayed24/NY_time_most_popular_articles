import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ny_time_most_popular_articles/core/utils/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../data/model/article_response.dart';
import '../components/article_details_components.dart';

class ArticleDetailsView extends StatelessWidget {
  final Article article;

  const ArticleDetailsView({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          AppStrings.appBarTitle,
          style: TextStyle(color: AppColors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () => context.pop(),
        ),
      ),
      body: ArticleDetailsComponents(
        article: article,
      ),
    );
  }
}
