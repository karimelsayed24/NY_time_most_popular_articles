import 'package:dartz/dartz.dart';
import 'package:ny_time_most_popular_articles/core/data/api/api_consumer.dart';
import 'package:ny_time_most_popular_articles/core/errors/error_model.dart';
import 'package:ny_time_most_popular_articles/core/errors/exceptions.dart';

import '../../../../../core/constants/endpoints_strings.dart';
import '../../model/article_response.dart';

abstract class ArticleApiServices {
  Future<Either<ErrorModel, ArticleResponse>> getMostPopularArticles(
      int period);
}

class ArticleApiServicesImpl implements ArticleApiServices {
  final ApiConsumer apiConsumer;
  ArticleApiServicesImpl(this.apiConsumer);
  @override
  Future<Either<ErrorModel, ArticleResponse>> getMostPopularArticles(
      int period) async {
    try {
      final response = await apiConsumer
          .get(EndpointsStrings.getMostPopularArticlesUrl(period));
      final articleResponse = ArticleResponse.fromJson(response);
      return Right(articleResponse);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
}
