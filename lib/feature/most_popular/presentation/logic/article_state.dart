
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/errors/error_model.dart';
import '../../data/model/article_response.dart';

part 'article_state.freezed.dart';

@freezed
class ArticlesState with _$ArticlesState {
  const factory ArticlesState.initial() = _Initial;
  const factory ArticlesState.loading() = _Loading;
  const factory ArticlesState.success(ArticleResponse response) = _Success;
  const factory ArticlesState.error(ErrorModel error) = _Error;
}