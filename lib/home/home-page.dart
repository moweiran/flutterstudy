import 'package:flutter/material.dart';
import 'package:flutterstudy/pullrefresh/PullRefreshPage.dart';
import 'package:qr_utils/qr_utils.dart';
import 'myhomepage.dart';

class HomePage extends StatefulWidget {
  final String title;
  HomePage({this.title});
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<dynamic> items = new List<dynamic>();
  String _scanBarcode = 'Unknown';

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
                  RaisedButton(
                    onPressed: scan,
                    child: Text("Go to QR scan"),
                  ),
                  Text(_scanBarcode),
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void scan() async {
    final content = await QrUtils.scanQR;
    if (! mounted) return;
    setState(() {
      _scanBarcode = content;
    });
  }
}
