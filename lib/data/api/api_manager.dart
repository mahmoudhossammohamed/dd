import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import '../model/news_response/NewsResponse.dart';
import '../model/sources_response/SourcesResponse.dart';

@singleton
class ApiManager {
  /*
  //add this line of code to make it singleton
  //static final ApiManager _apiManager = ApiManager._init();
  static final ApiManager instance = ApiManager._init();
  ApiManager._init();
  /*factory ApiManager(){
    return _apiManager;
  }*/
  //end of singleton*/

  static const baseUrl = 'newsapi.org';
  static const apiKey = "833dd0fe58b342afbd5347dcc91dbe5d";

  Future<SourcesResponse> getSources(String categoryId) async {
    var uri = Uri.https(
      baseUrl,
      'v2/top-headlines/sources',
      {
        "apiKey": apiKey,
        "category": categoryId, // RIGHT
        //"category": "categoryId", // WRONG
      },
    );



    try {
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        var sourcesResponse = SourcesResponse.fromJson(json);
        return sourcesResponse;
      } else {
        // Handle error scenario (e.g., throw an exception or print an error message)
        print('Error fetching sources: ${response.statusCode}');
        throw Exception('Failed to load sources');
      }
    } catch (error) {
      // Handle general errors (e.g., network issues)
      print('Error fetching sources: $error');
      throw Exception('Failed to load sources');
    }
  }

  Future<NewsResponse> getNews(String? sourceId) async{
    //https://newsapi.org/v2/everything?q=bitcoin&apiKey=833dd0fe58b342afbd5347dcc91dbe5d
    var uri = Uri.https(
      baseUrl,
      'v2/everything',
      {
        "apiKey": apiKey,
        "sources": sourceId, // RIGHT
        //"sources": "sourceId", // WRONG
      },
    );


    try {
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        var newsResponse = NewsResponse.fromJson(json);
        return newsResponse;
      } else {
        // Handle error scenario (e.g., throw an exception or print an error message)
        print('Error fetching sources: ${response.statusCode}');
        throw Exception('Failed to load sources');
      }
    } catch (error) {
      // Handle general errors (e.g., network issues)
      print('Error fetching sources: $error');
      throw Exception('Failed to load sources');
    }
  }

}
