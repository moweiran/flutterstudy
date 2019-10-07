import 'package:redux/redux.dart';

class FlutterState {}

///创建 Reducer
///源码中 Reducer 是一个方法 typedef State Reducer<State>(State state, dynamic action);
///我们自定义了 appReducer 用于创建 store
FlutterState appReducer(FlutterState state, action) {
  return FlutterState();
}

final List<Middleware<FlutterState>> middleware = [];
