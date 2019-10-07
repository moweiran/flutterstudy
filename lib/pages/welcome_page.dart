import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterstudy/common/redux/flutter_state.dart';
import 'package:flutterstudy/styles/flutter_colors.dart';
import 'package:flutterstudy/tabs/bottom-tabs.dart';
import 'package:redux/redux.dart';

class WelcomePage extends StatefulWidget {
  static final String sName = "/";

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool hadInit = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (hadInit) {
      return;
    }
    hadInit = true;

    ///防止多次进入
    Store<FlutterState> store = StoreProvider.of(context);
    new Future.delayed(const Duration(seconds: 2, milliseconds: 500), () {
      //   UserDao.initUserInfo(store).then((res) {
      //     if (res != null && res.result) {
      //       NavigatorUtils.goHome(context);
      //     } else {
      //       NavigatorUtils.goLogin(context);
      //     }
      //     return true;
      //   });
      Navigator.pushReplacementNamed(context, BottomTabs.sName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<FlutterState>(
      builder: (context, store) {
        double size = 200;
        return new Container(
          color: Color(FlutterColors.white),
          child: Stack(
            children: <Widget>[
              new Center(
                child: new Image(
                    image: new AssetImage('assets/images/welcome.png')),
              ),
              new Align(
                alignment: Alignment.bottomCenter,
                child: new Container(
                  width: size,
                  height: size,
                  child: new FlareActor("assets/files/flare_flutter_logo_.flr",
                      alignment: Alignment.topCenter,
                      fit: BoxFit.fill,
                      animation: "Placeholder"),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
