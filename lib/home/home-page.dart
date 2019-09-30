import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterstudy/model/common/responseData.dart';
import 'package:flutterstudy/model/news/news.dart';
import 'package:flutterstudy/pullrefresh/PullRefreshPage.dart';

import 'myhomepage.dart';

class HomePage extends StatefulWidget {
  final String title;
  HomePage({this.title});
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<dynamic> items = new List<dynamic>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            color: Colors.red,
                            padding: EdgeInsets.all(5.0),
                          ),
                          flex: 1,
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.yellow,
                            padding: EdgeInsets.all(5.0),
                          ),
                          flex: 2,
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.blue,
                            padding: EdgeInsets.all(5.0),
                          ),
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    child: RaisedButton(
                      child: Text('Go to Home Page'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MyHomePage(title: 'Home Page')),
                        );
                      },
                    ),
                  ),
                  Container(
                    child: RaisedButton(
                      child: Text('Go to PullRefreshPage'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PullRefreshPage(title: 'PullRefreshPage')),
                        );
                      },
                    ),
                  ),
                  Container(
                    child: RaisedButton(
                      child: Text('http post'),
                      onPressed: () {
                        getHttp();
                      },
                    ),
                  ),
                  SizedBox(
                    height: viewportConstraints.maxHeight - 60,
                    child: ListView.builder(
                      itemBuilder: (c, i) => NewsItem(items, i),
                      itemExtent: 100.0,
                      itemCount: items.length,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void getHttp() async {
    try {
      Response response = await Dio().post(
        "http://api2.portal.lwtch.com/api/v1.0/mobile/news/list",
        data: {
          "condition": {
            "title": '',
          },
          "pager": {
            "currentPage": 1,
            "itemPerPage": 10,
          }
        },
      );
      setState(() {
        items = response.data['data'];
      });
    } catch (e) {
      print(e);
    }
  }
}

class NewsItem extends StatefulWidget {
  List<dynamic> items;
  int index;
  NewsItem(this.items, this.index);

  @override
  NewsItemState createState() => NewsItemState();
}

class NewsItemState extends State<NewsItem> {
  NewsItemState();
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Text('${widget.items[widget.index]['subTitle']}'),
      ),
    );
  }
}
