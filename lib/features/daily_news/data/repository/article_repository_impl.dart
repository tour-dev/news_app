import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_app/features/daily_news/data/models/article.dart';
import 'package:news_app/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
      apiKey: newsAPIKey,
      country: countryQuery,
      category: categoryQuery,
    );

    if (httpResponse.response.statusCode == HttpStatus.ok) {
      return DataSuccess(httpResponse.data);
    } else {
      // Non-200 status: wrap in a DioException with context
        return DataFailed(
          DioException(
            requestOptions: httpResponse.response.requestOptions,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            error:
                'Unexpected status message: ${httpResponse.response.statusMessage}',
          ),
        );
    }
    } on DioException catch (e) {
      return DataFailed(e);
    } catch (e,s) {
      // Any other unexpected error → wrap into a DioException
      return DataFailed(
        DioException(
          requestOptions: RequestOptions(path: ''), // or something meaningful
          error: e,
          stackTrace: s,
          type: DioExceptionType.unknown,
        ),
      );
    }
  }
}
