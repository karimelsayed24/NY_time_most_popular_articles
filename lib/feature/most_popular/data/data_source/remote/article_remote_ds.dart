import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../../model/article_response.dart';
import 'article_api_services.dart';

abstract class ArticleRemoteDs {
   Future<Either<ErrorModel, ArticleResponse>> getMostPopularArticles(
      int period);
}

class ArticleRemoteDsImpl implements ArticleRemoteDs {
  final ArticleApiServices articleApiServices;
  ArticleRemoteDsImpl(this.articleApiServices);
  @override
  Future<Either<ErrorModel, ArticleResponse>> getMostPopularArticles(
      int period) async {
    return articleApiServices.getMostPopularArticles(period);
  }
}