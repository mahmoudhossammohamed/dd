import 'package:injectable/injectable.dart';
import 'package:news_app/data/api/api_manager.dart';

import '../dataSourceContract/news_data_source.dart';
import '../model/news_response/news.dart';
@Injectable(as: NewsDataSource)
class NewsOnlineDataSourceImpl extends NewsDataSource{
  ApiManager apiManager;

  @factoryMethod
  NewsOnlineDataSourceImpl.init(this.apiManager);

  Future<List<News>?> getNews(String? sourceId)async{

    var response =await apiManager.getNews(sourceId);
    return response.articles;
  }
}