import 'package:dartz/dartz.dart';

import '../../../../core/errors/error_model.dart';
import '../../data/model/article_response.dart';
import '../repo/article_repository.dart';

class GetMostPopularArticleUc {
  final ArticleRepository _articleRepository;

  GetMostPopularArticleUc(this._articleRepository);

  Future<Either<ErrorModel, ArticleResponse>> call(int period) async {
    return _articleRepository.getMostPopularArticles(period);
  }
}
