import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/di/di.dart';
import 'package:news_app/ui/home/news/news_view_model.dart';
import '../../../data/model/sources_response/Source.dart';
import 'package:news_app/ui/home/news/news_widget.dart';


class NewsListWidget extends StatefulWidget {
  Source source;
  NewsListWidget(this.source, {super.key});

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  late String sourceId;

  //var viewModel = NewsViewModel();
  var viewModel = getIt.get<NewsViewModel>();

  @override
  void initState() {
    sourceId = widget.source.id ?? "";
    viewModel.loadNews(sourceId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (sourceId != widget.source.id) {
      sourceId = widget.source.id ?? "";
      viewModel.loadNews(sourceId);
    }
    // call api
    return BlocBuilder<NewsViewModel, NewsListState>(
      bloc: viewModel,
      builder: (context, state) {
        switch (state) {
          case SuccessState():
            {
              var newsList = state.newsList;
              return ListView.builder(
                  itemBuilder: (context, index) {
                    return NewsWidget(newsList![index]);
                  },
                  itemCount: newsList?.length ?? 0);
            }
          case LoadingState():
            {
              Center(
                  child: Column(
                children: [
                  Text(state.message),
                  ElevatedButton(
                      onPressed: () {
                        viewModel.loadNews(widget.source.id);
                      }, child: const Text("Try Again")),
                ],
              ));
            }
          case ErrorState():
            {
              return const Center(child: CircularProgressIndicator());
            }
        }
        return Container();
      },

    );

    /*return FutureBuilder(
      future: ApiManager.getNews(source.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || snapshot.data?.status == 'error') {
          Center(
            child: Column(
              children: [
                Text(snapshot.data?.message ?? snapshot.error.toString()),
                ElevatedButton(onPressed: () {}, child: const Text("Try Again")),
              ],
            ),
          );
        }

        var newsList = snapshot.data?.articles;
        return ListView.builder(
            itemBuilder: (context, index) {
              return NewsWidget(newsList![index]);
            },
            itemCount: newsList?.length ?? 0);
      },
    );*/
  }
}

