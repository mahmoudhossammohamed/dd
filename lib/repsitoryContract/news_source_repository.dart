import '../data/model/sources_response/Source.dart';

abstract class NewsSourceRepository{
  Future<List<Source>?> getSources(String catId);
}