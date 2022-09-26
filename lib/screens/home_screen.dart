import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_app_clone_ui/components/breaking_news_card.dart';
import 'package:news_app_clone_ui/components/news_list_title.dart';
import 'package:news_app_clone_ui/models/news_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          'News App',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_outlined),
            color: Colors.red,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Breaking News',
                style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CarouselSlider.builder(
                itemCount: NewsData.breakingNewsData.length,
                itemBuilder: (context, index, realIndex) =>
                    BreakingNewsCard(NewsData.breakingNewsData[index]),
                options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'Recent News',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Column(
                children: NewsData.recentNewsData
                    .map((e) => NewsListTitle(e))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: BottomNavigationBar(
            elevation: 0.0,
            selectedItemColor: Colors.orange,
            items: [
              BottomNavigationBarItem(
                backgroundColor: Colors.transparent,
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                label: "Bookmark",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.rss_feed_rounded),
                label: "Feed",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
              ),
            ]),
      ),
    );
  }
}
