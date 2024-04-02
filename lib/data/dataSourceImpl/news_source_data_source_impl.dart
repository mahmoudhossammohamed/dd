import 'package:injectable/injectable.dart';
import 'package:news_app/data/api/api_manager.dart';

import '../dataSourceContract/news_source_data_source.dart';
import '../model/sources_response/Source.dart';

@Injectable(as: NewsSourceDataSource)
class NewsSourceDataSourceImpl extends NewsSourceDataSource{
  ApiManager apiManager;

  @factoryMethod
  NewsSourceDataSourceImpl(this.apiManager);//constructor injection =>we used it to decrease the coupleing
  //dependency injection is when a class need an object from another class



  @override
  Future<List<Source>?> getSources(String catId) async{
    var response = await apiManager.getSources(catId);
    return response.sources;
  }
}