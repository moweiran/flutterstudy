import 'package:flutter/material.dart';
import 'package:flutterstudy/home/home-page.dart';

class BottomTabs extends StatefulWidget {
  static final String sName = "tabs";
  BottomTabs();

  @override
  BottomTabsState createState() => BottomTabsState();
}

class BottomTabsState extends State<BottomTabs>
    with SingleTickerProviderStateMixin {
  BottomTabsState();
  TabController tabController;
  @override
  initState() {
    super.initState();
    tabController = new TabController(length: pages.length, vsync: this);
  }

//当前显示页面的
  int currentIndex = 0;

  final pages = [
    HomePage(title: 'HomePage'),
    ChildItemView("发现"),
    ChildItemView("动态"),
    ChildItemView("我的")
  ];

  @override
  Widget build(BuildContext context) {
    return buildBottomTabScaffold();
  }

  Widget buildBottomTabScaffold() {
    return new Scaffold(
      body: new TabBarView(controller: tabController, children: pages),
      bottomNavigationBar: new Material(
        color: Colors.blue,
        child: new TabBar(
          controller: tabController,
          tabs: <Tab>[
            new Tab(text: "首页", icon: new Icon(Icons.home)),
            new Tab(text: "发现", icon: new Icon(Icons.find_in_page)),
            new Tab(text: "动态", icon: new Icon(Icons.message)),
            new Tab(text: "我的", icon: new Icon(Icons.person)),
          ],
          indicatorWeight: 0.1,
        ),
      ),
    );
  }

  /*切换页面*/
  // void _changePage(int index) {
  //   /*如果点击的导航项不是当前项  切换 */
  //   if (index != currentIndex) {
  //     setState(() {
  //       currentIndex = index;
  //     });
  //   }
  // }
}

//子页面
class ChildItemView extends StatefulWidget {
  final String _title;

  ChildItemView(this._title);

  @override
  _ChildItemViewState createState() => _ChildItemViewState();
}

class _ChildItemViewState extends State<ChildItemView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text(widget._title)),
    );
  }
}
