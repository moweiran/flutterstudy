import 'package:flutter/material.dart';
import 'package:flutterstudy/tabs/bottom-tabs.dart';
// import 'package:flutterstudy/tabs/top-tabs.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp() {
    // final router = new Router();
    // Routes.configureRoutes(router);
    // 这里设置项目环境
    // Application.router = router;
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        highlightColor: Color.fromRGBO(136, 207, 126, 1),
        splashColor: Colors.purple,
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      // home: TopTabs(),
      home: BottomTabs(),
    );
  }
}
