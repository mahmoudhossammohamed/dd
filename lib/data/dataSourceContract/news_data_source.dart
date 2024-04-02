import '../model/news_response/news.dart';

abstract class NewsDataSource{
  Future<List<News>?> getNews(String? sourceId);
}