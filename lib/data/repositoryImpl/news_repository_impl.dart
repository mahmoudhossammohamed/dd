//import 'dart:html';

import 'package:injectable/injectable.dart';
import 'package:news_app/data/dataSourceContract/news_data_source.dart';
import 'package:news_app/repsitoryContract/news_repository_contract.dart';

import '../model/news_response/news.dart';

@Injectable(as: NewsRepository)
class NewsRepositoryImpl extends NewsRepository{
  NewsDataSource onlineDataSource;

  @factoryMethod
  NewsRepositoryImpl(this.onlineDataSource);

   @override
  Future<List<News>?> getNews(String? sourceId) {
     return onlineDataSource.getNews(sourceId);
  }

}