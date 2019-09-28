import 'package:flutter/material.dart';
import 'package:recap2019/controller/QRScanner/QRScannerController.dart';
import 'package:recap2019/controller/QRGenerator/QRGeneratorController.dart';
import 'package:recap2019/controller/component/BottomNavBar.dart';
import 'package:recap2019/controller/component/ResultListDrawer/ResultListDrawer.dart';

// import 'package:recap2019/service/BottomNavBloc.dart';

class ScreenFactory {

  static List<Widget> _childList = [
    QRScannerController(),
    QRGeneratorController()
  ];


  static Widget createScreen(int screenIndex) {

    print('screenIndex: ' + screenIndex.toString());

    // BottomNavBloc _bottomNavBloc = BottomNavBloc();

    Widget childWidget;
    String screenName;

    switch (screenIndex) {
      case 0: {
        childWidget = _childList[0];
        screenName= 'scanner';
      }
      break;
      case 1: {
        childWidget = _childList[1];
        screenName = 'generator';
      }
      break;
      default: {
        throw Exception('QR APP: Unexcepted screenName given in ScreenFactory');
      }
    }

    return ScreenTemplate(screenName, childWidget);

  }

}

class ScreenTemplate extends StatelessWidget {

  final String _screenName;
  final Widget _childWidget;

  ScreenTemplate(this._screenName, this._childWidget);

  void _viewListItemOnPress(BuildContext context) {
    Navigator.of(context)
      .push(MaterialPageRoute<void>(builder: (BuildContext context) {
    return ResultListDrawer();
    }));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this._screenName),
        actions: <Widget>[
          IconButton(onPressed: ()=> _viewListItemOnPress(context), icon: Icon(Icons.list))
        ]
      ),
      body: this._childWidget,
      bottomNavigationBar: BottomNavBar()
    );
  }
}