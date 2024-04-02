import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../data/model/sources_response/Source.dart';
import '../../../repsitoryContract/news_source_repository.dart';

@injectable
class CategoryDetailsViewModel extends Cubit<CategoryDetailsState> {
  NewsSourceRepository repository;
  /*late NewsSourceDataSource dataSource;
  late ApiManager apiManager;*/

  @factoryMethod
  CategoryDetailsViewModel(this.repository):super(LoadingState('Loading...'));
  //{
    //dependency tree  //use the creational patterns(singleton, factory, builder) in the design pattern
    //apiManager = ApiManager(); //deactivate this line because we want to use a singleton
    /*apiManager = ApiManager.instance;
    dataSource = NewsSourceDataSourceImpl(apiManager);
    repository = NewsSourceRepositoryImpl(dataSource);*/

  //}

  void loadSources(String categoryId) async{
    emit(LoadingState('Loading...'));
    try{
      var sourcesList = await repository.getSources(categoryId);
      emit(SuccessState(sourcesList));
      // we will handle the rest of the error later
      /*if(response.status == 'error'){
        emit(ErrorState(response.message??" "));
      }else{
        emit(SuccessState(response.sources));
      }*/
    }catch(e){
      emit(ErrorState(e.toString()));
    }
  }
}


sealed class CategoryDetailsState{
}
class SuccessState extends CategoryDetailsState{
  List<Source>? sourceList;
  SuccessState(this.sourceList);
}
class LoadingState extends CategoryDetailsState{
  String message;
  LoadingState(this.message);
}
class ErrorState extends CategoryDetailsState{
  String errorMessage;
  ErrorState(this.errorMessage);
}