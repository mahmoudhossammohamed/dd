
import '../model/sources_response/Source.dart';

abstract class NewsSourceDataSource{
  Future<List<Source>?> getSources(String catId);
}