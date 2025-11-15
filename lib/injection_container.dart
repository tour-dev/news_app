// Used for dependecy injection
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_app/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:news_app/features/daily_news/domain/repository/article_repository.dart';
import 'package:news_app/features/daily_news/domain/usecases/get_article.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dependencies registration

  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Services
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  // Repository
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));

  // UseCases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  // Blocs - will return multiple instances when state changes so should not be registered as singletons
  sl.registerFactory<RemoteArticlesBloc>(
    () => RemoteArticlesBloc(sl())
  );

}
