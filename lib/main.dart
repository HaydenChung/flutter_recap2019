import 'package:flutter/material.dart';
import 'package:recap2019/style/theme.dart';
import 'package:recap2019/controller/ScreenFactory.dart';
import 'package:recap2019/redux/store.dart';
import 'package:recap2019/redux/app/AppState.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:recap2019/local_storage/SharedPref.dart';

void main() async {

  //Init shared_preference before create Redux store
  SharedPref sharedPref = SharedPref();
  await sharedPref.initial();

  var store = createStore();

  return runApp(App(store));
}

class App extends StatefulWidget {

  final Store<AppState> store;

  App(this.store);

  @override
  _AppState createState() => _AppState();

  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Kanhan QR Code Demo',
      home: ScreenFactory.createScreen(0),
      theme: primaryTheme()
    );
  }
}

class _AppState extends State<App> {

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: widget.store,
      child: MaterialApp(
        title: 'Kanhan QR Code Demo',
        home: StoreConnector<AppState, AppState> (
          converter: (store) => store.state,
          builder: (BuildContext context, AppState data) {
            return ScreenFactory.createScreen(data.routeState.pageIndex);
          }
        ),
        theme: primaryTheme()
      )
    );
  }

}
