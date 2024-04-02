import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/di/di.dart';
import 'package:news_app/ui/home/categories/category.dart';
import 'package:news_app/ui/home/categoryDetails/category_details_view_model.dart';
import 'package:news_app/ui/home/categoryDetails/sources_tabs_widget.dart';

class CategoryDetails extends StatefulWidget {
  Category category;
  CategoryDetails(this.category, {super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  //var viewModel = CategoryDetailsViewModel();
  var viewModel = getIt.get<CategoryDetailsViewModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.loadSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    //call api
    //BlocConsumer(builder: builder, listener: listener);
    return BlocBuilder<CategoryDetailsViewModel, CategoryDetailsState>(
        bloc:viewModel,
        builder: (context, state) {
          switch(state){
            case SuccessState() :{
              var sourceList = state.sourceList;
              return SourcesTabsWidget(sourceList!);
            }
            case LoadingState() :{
              //implicit casting
              return Center(child: Column(
                children: [
                  Text(state.message),
                  CircularProgressIndicator(),
                ],
              ));
            }
            case ErrorState() :{
              return Center(
                child: Column(
                  children: [
                    Text(state.errorMessage),
                    ElevatedButton(onPressed: () {
                      viewModel.loadSources(widget.category.id);
                    }, child: const Text("Try Again")),
                  ],
                ),
              );
            }
          }
        },
    );

    /*return FutureBuilder(
      future: ApiManager.getSources(category.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || snapshot.data?.status == 'error') {
          return Center(
            child: Column(
              children: [
                Text(snapshot.data?.message ?? snapshot.error.toString()),
                ElevatedButton(onPressed: () {}, child: Text("Try Again")),
              ],
            ),
          );
        }
        var sourceList = snapshot.data?.sources;
        return SourcesTabsWidget(sourceList!);
      },
    );*/
  }
}
