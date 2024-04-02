
import '../data/model/news_response/news.dart';

abstract class NewsRepository{
  Future<List<News>?> getNews(String? sourceId);
}