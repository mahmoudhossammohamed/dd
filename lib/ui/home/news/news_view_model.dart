import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../data/model/news_response/news.dart';
import '../../../repsitoryContract/news_repository_contract.dart';

@injectable
class NewsViewModel extends Cubit<NewsListState>{
  //make them late => and do the rest of these code
  NewsRepository newsRepository;
  /*late NewsDataSource newsDataSource;
  late ApiManager apiManager;*/

  @factoryMethod
  NewsViewModel(this.newsRepository):super(LoadingState('Loading...'));
  /*{
    //dependency tree
    //apiManager = ApiManager(); //deactivate this line because we want to use a singleton
    apiManager = ApiManager.instance;
    newsDataSource = NewsOnlineDataSourceImpl(apiManager);
    newsRepository = NewsRepositoryImpl(newsDataSource);
  }*/
  void loadNews(String? sourceId)async{
    emit(LoadingState('Loading...'));
    try{
      var newsList = await newsRepository.getNews(sourceId);
      //await ApiManager().getNews(sourceId);
      emit(SuccessState(newsList));
      /*if(response.status == 'error'){
        emit(ErrorState(response.message??" "));
      }else{
        emit(SuccessState(response.articles));
      }*/
    }catch(e){
      emit(ErrorState(e.toString()));
    }
  }
}


sealed class NewsListState{}

class SuccessState extends NewsListState{
  List<News>? newsList;
  SuccessState(this.newsList);
}
class LoadingState extends NewsListState{
  String message;
  LoadingState(this.message);
}
class ErrorState extends NewsListState{
  String errorMessage;
  ErrorState(this.errorMessage);
}

/*class NewsWidget2{
  int? id;
  String? date;
  String? title;
  String? content;
  NewsWidget2(this.id);
  NewsWidget2.fromTitle(this.title);
  NewsWidget2.init(this.id,this.title);
}*/