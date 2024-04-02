import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../data/model/news_response/news.dart';


class NewsWidget extends StatefulWidget {
  News news;
  NewsWidget(this.news,{super.key});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(borderRadius: BorderRadius.circular(16),
              //it's a url (link) not an image
             child:
             CachedNetworkImage(
               imageUrl: widget.news.urlToImage??"",
               height: 220,
               width: double.infinity,
               fit: BoxFit.fill,
               progressIndicatorBuilder: (context, url, downloadProgress) =>
                   Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
               errorWidget: (context, url, error) => const Icon(Icons.error),
             ),


            /*Image.network(news.urlToImage??"",
                height: 220,
                width: double.infinity,
                fit: BoxFit.fill,
              )*/
          ),
          Text(widget.news.author??"", textAlign: TextAlign.start,),
          Text(widget.news.title??"", textAlign: TextAlign.start,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400
          ),),
          Text(widget.news.publishedAt??"", textAlign: TextAlign.end,),
        ],
      ),
    );
  }
}
