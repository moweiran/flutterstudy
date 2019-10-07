import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterstudy/model/common/global.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PullRefreshPage extends StatefulWidget {
  final String title;
  PullRefreshPage({Key key, this.title}) : super(key: key);

  @override
  PullRefreshPageState createState() => PullRefreshPageState();
}

class PullRefreshPageState extends State<PullRefreshPage> {
  var condition = {'title': ''};
  var pager = {'currentPage': 1, 'itemPerPage': 10};
  List<dynamic> items = [];
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    getHttp();
  }

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    // await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    pager['currentPage']++;
    getHttp();
    if (mounted) {
      setState(() {});
    }
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              //   body = Text("pull up load");
            } else if (mode == LoadStatus.loading) {
              body = CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = Text("Load Failed!Click retry!");
            } else if (mode == LoadStatus.canLoading) {
              body = Text("release to load more");
            } else {
              body = Text("No more Data");
            }
            return Container(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: ListView.builder(
          itemBuilder: (c, i) => NewsItem(items[i], i),
          itemExtent: 70.0,
          itemCount: items.length,
        ),
      ),
    );
  }

  void getHttp() async {
    print(pager);
    try {
      Response response = await Dio().post(
        "http://api2.portal.lwtch.com/api/v1.0/mobile/news/list",
        data: {"condition": condition, "pager": pager},
      );
      setState(() {
        print(response.data['data']);
        items.addAll(response.data['data']);
      });
    } catch (e) {
      print(e);
    }
  }
}

class NewsItem extends StatefulWidget {
  final dynamic item;
  final int index;
  NewsItem(this.item, this.index);

  @override
  NewsItemState createState() => NewsItemState();
}

class NewsItemState extends State<NewsItem> {
  NewsItemState();

  _gotoNewsDetail(int id) {
    print(id);
    Fluttertoast.showToast(
        msg: 'This is Center Short Toast ${id.toString()}',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    int id = widget.item['id'];
    String subTitle = widget.item['subTitle'];
    String imageUrl =
        '${GlobalConfig.apiHost}/File/Image/Single/${widget.item['coverImageId']}';
    return InkWell(
      onTap: () => _gotoNewsDetail(id),
      child: Container(
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              child: Container(
                  child: CachedNetworkImage(
                    key: new ValueKey(imageUrl),
                    imageUrl: imageUrl,
                    width: 80,
                    //   height:80,
                  ),
                  width: 10,
                  height: 60,
                  alignment: Alignment.center),
              flex: 4,
            ),
            Expanded(
              child: Container(
                child: Text(subTitle),
                padding: EdgeInsets.all(5.0),
              ),
              flex: 12,
            ),
            Expanded(
              child: Container(
                child: Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                  size: 30,
                ),
                alignment: Alignment.centerRight,
              ),
              flex: 2,
            )
          ],
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 0.2,
              style: BorderStyle.solid,
            ),
          ),
        ),
      ),
    );
  }
}

class Pager {
  int currentPage;
  int itemPerPage;
  Pager(this.currentPage, this.itemPerPage);
}
