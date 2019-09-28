import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:recap2019/redux/app/AppState.dart';
import './ResultListDrawerModel.dart';

class ResultListDrawer extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState()=> ResultListDrawerState();
}

class ResultListDrawerState extends State<ResultListDrawer> {


  @override
  Widget build(BuildContext context) {



    return StoreConnector <AppState, ResultListDrawerModel> (
      converter: (store)=> ResultListDrawerModel.formStore(store),
      builder: (BuildContext context, ResultListDrawerModel drawerModel) {

        List<Widget> listChildren = [];
        
        for(String result in drawerModel.resultList) {
          listChildren.add(ListTile(title: Text(result)));
        }

    // ListView listWidget = ListView(
    //   children: listChildern
        
      
    //   // [
    //   //   ListTile(title: Text('test'), trailing: Icon(MdiIcons.menu))
    //   // ],
    // );

        return Scaffold(
          appBar: AppBar(
            title: const Text('Scanned Result')
          ),
          body: Container(
            child: Center(
              child: Material(
                child: ListView(
                  children: listChildren
                  // drawerModel.resultList.map(result => ListTile(title: Text(result), trailing: Icon(MdiIcons.menu))),
                )
              )
            )
          )
        );

      }
    );
  }
}