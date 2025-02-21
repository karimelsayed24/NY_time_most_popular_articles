import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../feature/most_popular/data/data_source/remote/article_api_services.dart';
import '../../feature/most_popular/data/data_source/remote/article_remote_ds.dart';
import '../../feature/most_popular/domain/repo/article_repository.dart';
import '../../feature/most_popular/domain/usecase/get_most_popular_article_uc.dart';
import '../../feature/most_popular/presentation/logic/article_cubit.dart';
import '../data/api/api_consumer.dart';
import '../data/api/dio_consumer.dart';
import '../data/cached/cache_helper.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  
  getIt.registerFactoryAsync<SharedPreferences>(() async {
    return await SharedPreferences.getInstance();
  });
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt
      .registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: getIt<Dio>()));


 
//!Api Services //
  getIt.registerLazySingleton<ArticleApiServices>(
      () => ArticleApiServicesImpl(getIt()));

  //!Data Sources //
  getIt.registerLazySingleton<ArticleRemoteDs>(
      () => ArticleRemoteDsImpl(getIt()));
  
  getIt.registerLazySingleton<ArticleRepository>(
      () => ArticleRepositoryImpl(getIt(),));

  //!Use Cases //
  getIt.registerLazySingleton<GetMostPopularArticleUc>(
      () => GetMostPopularArticleUc(getIt()));

  //!Cubit //
  getIt.registerFactory<ArticlesCubit>(() => ArticlesCubit(getIt()));
}
