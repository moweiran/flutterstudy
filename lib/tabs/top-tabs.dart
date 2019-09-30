import 'package:flutter/material.dart';
// import 'package:flutterstudy/home/myhomepage.dart';
// import 'package:flutterstudy/pullrefresh/PullRefreshPage.dart';

class TopTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation',
            onPressed: () => debugPrint('Navigation button is pressed'),
          ),
          title: Text('连网同城后台管理系统'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              onPressed: () => debugPrint('Search button is pressed'),
            ),
            IconButton(
              icon: Icon(Icons.more_horiz),
              tooltip: 'More',
              onPressed: () => debugPrint('More button is pressed'),
            )
          ],
          bottom: TabBar(
            unselectedLabelColor: Colors.green,
            indicatorColor: Colors.orange,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 10.0,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.local_florist)),
              Tab(icon: Icon(Icons.change_history)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Icon(Icons.local_florist, size: 128.0, color: Colors.black12),
            Icon(Icons.change_history, size: 128.0, color: Colors.black12),
            Icon(Icons.directions_bike, size: 128.0, color: Colors.black12),
          ],
        ),
      ),
    );
  }
}
