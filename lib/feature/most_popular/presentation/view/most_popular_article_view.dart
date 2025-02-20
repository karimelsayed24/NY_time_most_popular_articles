import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../components/most_popular_article_components.dart';
import '../logic/article_cubit.dart';

class MostPopularArticleView extends StatelessWidget {
  const MostPopularArticleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          AppStrings.appBarTitle,
          style: TextStyle(color: AppColors.white),
        ),
        actions: [
          PopupMenuButton<int>(
            onSelected: (period) {
              context.read<ArticlesCubit>().getMostPopularArticle(period);
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 1,
                child: Text('1 Day'),
              ),
              const PopupMenuItem(
                value: 7,
                child: Text('7 Days'),
              ),
              const PopupMenuItem(
                value: 30,
                child: Text('30 Days'),
              ),
            ],
            icon: const Icon(Icons.filter_list, color: AppColors.white),
          )
        ],
      ),
      body: const MostPopularArticleComponents(),
    );
  }
}
