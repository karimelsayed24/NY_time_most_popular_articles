import 'package:bloc/bloc.dart';

import '../../domain/usecase/get_most_popular_article_uc.dart';
import 'article_state.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  final GetMostPopularArticleUc _getMostPopularUseCase;

  ArticlesCubit(this._getMostPopularUseCase) : super(const ArticlesState.initial());

  Future<void> getMostPopularArticle(int period ) async {
    emit(const ArticlesState.loading());
    final result = await _getMostPopularUseCase.call(period);
    result.fold(
      (error) => emit(ArticlesState.error(error)),
      (response) => emit(ArticlesState.success(response)),
    );
  }
}