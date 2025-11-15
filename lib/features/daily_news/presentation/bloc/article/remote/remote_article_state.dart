import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';

abstract class RemoteArticlesState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? error;

  const RemoteArticlesState({this.articles, this.error});

  @override
  List<Object?> get props => [articles!, error!];
}

// When articles are being fetched
class RemoteArticlesLoading extends RemoteArticlesState {
  const RemoteArticlesLoading();
}

// When articles are fetched successfully from the store
class RemoteArticlesDone extends RemoteArticlesState {
  const RemoteArticlesDone(List<ArticleEntity> articles)
    : super(articles: articles);
}

// When an error occurs while fetching the articles
class RemoteArticlesError extends RemoteArticlesState {
  const RemoteArticlesError(DioException error) : super(error: error);
}
