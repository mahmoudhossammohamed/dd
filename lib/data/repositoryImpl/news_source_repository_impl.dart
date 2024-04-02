import 'package:injectable/injectable.dart';
import 'package:news_app/data/model/sources_response/Source.dart';

import '../../repsitoryContract/news_source_repository.dart';
import '../dataSourceContract/news_source_data_source.dart';
//import '../model/sources_response/Source.dart';
//          concrete                      interface
@Injectable(as: NewsSourceRepository)
class NewsSourceRepositoryImpl extends NewsSourceRepository{

  NewsSourceDataSource onlineDataSource;//dependancy

  @factoryMethod
  NewsSourceRepositoryImpl(this.onlineDataSource);

  @override
  Future<List<Source>?> getSources(String catId) {
    return onlineDataSource.getSources(catId);
  }

}