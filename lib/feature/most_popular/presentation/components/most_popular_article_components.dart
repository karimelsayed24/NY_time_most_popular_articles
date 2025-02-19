import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/article_cubit.dart';
import '../logic/article_state.dart';
import '../widgets/article_list.dart';

class MostPopularArticleComponents extends StatelessWidget {
  const MostPopularArticleComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesCubit, ArticlesState>(
      builder: (context, state) {
        return state.when(
          initial: () =>
              const Center(child: Text('Select a period to load articles')),
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (response) => ArticleList(
            response: response,
          ),
          error: (error) =>
              Center(child: Text('Error: ${error.fault.faultstring}')),
        );
      },
    );
  }
}
