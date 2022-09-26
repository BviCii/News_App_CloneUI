import 'package:flutter/material.dart';
import 'package:news_app_clone_ui/models/news_model.dart';
import 'package:news_app_clone_ui/screens/detail_screen.dart';

class NewsListTitle extends StatefulWidget {
  NewsListTitle(this.data, {Key? key}) : super(key: key);
  NewsData data;

  @override
  State<NewsListTitle> createState() => _NewsListTitleState();
}

class _NewsListTitleState extends State<NewsListTitle> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailScreen(widget.data)));
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 20.0),
        padding: EdgeInsets.all(12.0),
        height: 130,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(26.0),
        ),
        child: Row(
          children: [
            Flexible(
              flex: 3,
              child: Hero(
                tag: "${widget.data.title}",
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(widget.data.urlToImage!),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Flexible(
              flex: 5,
              child: Column(
                children: [
                  Text(
                    widget.data.title!,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    widget.data.content!,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
