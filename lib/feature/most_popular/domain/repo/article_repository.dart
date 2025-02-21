import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/data/cached/cache_helper.dart';
import '../../../../core/errors/error_model.dart';
import '../../data/model/article_response.dart';
import '../../data/data_source/remote/article_remote_ds.dart';

abstract class ArticleRepository {
  Future<Either<ErrorModel, ArticleResponse>> getMostPopularArticles(
      int period);
}

// class ArticleRepositoryImpl implements ArticleRepository {
//   final ArticleRemoteDs articleRemoteDs;
//   ArticleRepositoryImpl(this.articleRemoteDs);
//   @override
//   Future<Either<ErrorModel, ArticleResponse>> getMostPopularArticles(
//       int period) async {
//     return articleRemoteDs.getMostPopularArticles(period);
//   }
// }

class ArticleRepositoryImpl implements ArticleRepository {
  final ArticleRemoteDs articleRemoteDs;

  ArticleRepositoryImpl(
    this.articleRemoteDs,
  );

  @override
  Future<Either<ErrorModel, ArticleResponse>> getMostPopularArticles(
      int period) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      final cachedData = CacheHelper.getJson(key: 'cached_articles');
      if (cachedData != null) {
        
        return Right(ArticleResponse.fromJson(cachedData));
      } else {
        return Left(
          ErrorModel(
            fault: Fault(
              faultstring: 'No Internet Connection',
              detail: Detail(errorcode: 'NO_INTERNET'),
            ),
          ),
        );
      }
    }

    final result = await articleRemoteDs.getMostPopularArticles(period);
    result.fold(
      (error) => null,
      (response) {
        CacheHelper.saveJson(key: 'cached_articles', json: response.toJson());
      },
    );
    return result;
  }
}
