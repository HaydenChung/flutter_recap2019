import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:recap2019/controller/component/BottomNavBarModel.dart';
import 'package:recap2019/redux/app/AppState.dart';

class BottomNavBar extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => BottomNavBarState();

}

class BottomNavBarState extends State<BottomNavBar> {

  int _currentIndex = 0;
  final List<String> _pathList = [
    '/scanner',
    '/generator'
  ];

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, BottomNavBarModel>(
      // onInit: (store){

      // },
      converter: (store)=> BottomNavBarModel.formStore(store),
      builder: (_, viewModel) {
        return BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.camera),
                title: const Text('Scan')
            ),
            BottomNavigationBarItem(
                icon: const Icon(Icons.blur_on),
                title: const Text('Gen QRCode')
            )
          ],
          onTap: (int index) {
            setState(() {
              _currentIndex= index;
            });
            this.onButtonTapHandler(context, index, viewModel);
          },
          currentIndex: _currentIndex
        );
      }
    );

  }

  void onButtonTapHandler(BuildContext context, int index, BottomNavBarModel viewModel) {
    setState(() {
      _currentIndex= index;
      viewModel.changeIndex(index);

    });
      print('onTap Index:' + viewModel.routeIndex.toString());    
    // Navigator.pushNamed(context, this._pathList[index]);
  }
}