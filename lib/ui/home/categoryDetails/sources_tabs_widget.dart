import 'package:flutter/material.dart';
import 'package:news_app/ui/home/categoryDetails/tab_widget.dart';

import '../../../data/model/sources_response/Source.dart';

import '../news/news_list_widget.dart';

class SourcesTabsWidget extends StatefulWidget {
  List<Source> sources;
  SourcesTabsWidget(this.sources,{super.key});

  @override
  State<SourcesTabsWidget> createState() => _SourcesTabsWidgetState();
}

class _SourcesTabsWidgetState extends State<SourcesTabsWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: widget.sources.length,
      child: Column(
        children: [
          const SizedBox(height: 10),
          TabBar(
            indicatorColor: Colors.transparent,
            onTap: (newIndex){
              selectedIndex = newIndex;
              setState(() {});
            },
            isScrollable: true,
              tabs: widget.sources.map((source) => TabWidget(
                widget.sources.indexOf(source) == selectedIndex
              , source)).toList()
          ),
          //Expanded(child: NewsListWidget(widget.sources[selectedIndex])),
          Expanded(child: selectedIndex < widget.sources.length ? NewsListWidget(widget.sources[selectedIndex]) : Container()),
          //Expanded(child: NewsListWidget(widget.sources[selectedIndex]?.sources)),


        ],
      ),
    );
  }
}
