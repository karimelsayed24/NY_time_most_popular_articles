import 'package:dartz/dartz.dart';

import '../../../../core/errors/error_model.dart';
import '../../data/model/article_response.dart';
import '../../data/remote/article_remote_ds.dart';

abstract class ArticleRepository {
  Future<Either<ErrorModel, ArticleResponse>> getMostPopularArticles(
      int period);
}


class ArticleRepositoryImpl implements ArticleRepository {
  final ArticleRemoteDs articleRemoteDs;
  ArticleRepositoryImpl(this.articleRemoteDs);
  @override
  Future<Either<ErrorModel, ArticleResponse>> getMostPopularArticles(
      int period) async {
    return articleRemoteDs.getMostPopularArticles(period);
  }
}