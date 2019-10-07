import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterstudy/pages/welcome_page.dart';
import 'package:flutterstudy/tabs/bottom-tabs.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';

import 'common/redux/flutter_state.dart';

void main() {
  runZoned(() {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      Zone.current.handleUncaughtError(details.exception, details.stack);
      return Container(color: Colors.transparent);
    };
    runApp(MyApp());
    PaintingBinding.instance.imageCache.maximumSize = 100;
    Provider.debugCheckInvalidValueType = null;
  }, onError: (Object obj, StackTrace stack) {
    print(obj);
    print(stack);
  });
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final store = new Store<FlutterState>(
    appReducer,
    middleware: middleware,
    initialState: FlutterState(),
  );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: new StoreBuilder<FlutterState>(builder: (context, store) {
        return MaterialApp(
          // debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            highlightColor: Color.fromRGBO(136, 207, 126, 1),
            splashColor: Colors.purple,
          ),
          // home: MyHomePage(title: 'Flutter Demo Home Page'),
          // home: TopTabs(),
          //   home: BottomTabs(),
          routes: {
            WelcomePage.sName: (context) {
              return WelcomePage();
            },
            BottomTabs.sName: (context) {
              return BottomTabs();
            }
          },
        );
      }),
    );
  }
}
