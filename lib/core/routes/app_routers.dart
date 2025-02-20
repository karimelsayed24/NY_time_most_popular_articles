import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ny_time_most_popular_articles/core/services/service_locator.dart';

import '../../feature/most_popular/data/model/article_response.dart';
import '../../feature/most_popular/presentation/logic/article_cubit.dart';
import '../../feature/most_popular/presentation/view/article_details_view.dart';
import '../../feature/most_popular/presentation/view/most_popular_article_view.dart';
import 'router_names.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: RouterNames.mostPopularArticleView,
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<ArticlesCubit>()..getMostPopularArticleUc(1),
        child: const MostPopularArticleView(),
      ),
    ),
    GoRoute(
      path: RouterNames.articleDetailsView,

      builder: (context, state) {
    final article = state.extra as Article;
        return ArticleDetailsView(article: article);
      },
    ),
  ],
);
