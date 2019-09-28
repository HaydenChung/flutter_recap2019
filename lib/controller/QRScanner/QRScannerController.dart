import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:fzxing/fzxing.dart';
import 'dart:async';
import './QRResultSet.dart';
import './QRResultSetModel.dart';
import 'package:recap2019/redux/app/AppState.dart';
import 'package:recap2019/redux/scan_result/scan_result_actions.dart';
import 'package:flutter_redux/flutter_redux.dart';

class QRScannerController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScannerController> {
  @override
  Widget build(BuildContext context) {

    return StoreConnector<AppState, QRResultSetModel> (
      converter: (store)=> QRResultSetModel.formStore(store),
      builder: (_, viewModel) {
        return Container(
            child: Stack(
              children: <Widget> [
                Align(
                  alignment: FractionalOffset(0.5, 0.7),
                  child: SizedBox(
                      width: 120,
                      height: 120,
                      child: FloatingActionButton(
                        child: LayoutBuilder(builder: (context, constraint) {
                          
                          return Icon(MdiIcons.cameraEnhanceOutline,
                              size: constraint.biggest.shortestSide - 50,
                              color: Colors.amber[200]);
                      }),
                    tooltip: 'Start Scanning',
                    onPressed: ()=> _onScanBtnPressed(viewModel),
                    backgroundColor: Colors.white,
                  )
                )
              ),
              // Positioned(child: ,)
            ]
          )
        );
      },
    );


  }

  Future _onScanBtnPressed(QRResultSetModel viewModel) async {
    
    Fzxing.scan(isBeep: true, isContinuous: false).then((resultList) {

      if(resultList != null && resultList.length > 0) {
        viewModel.addResult(resultList[0]);

        Navigator.of(context)
            .push(MaterialPageRoute<void>(builder: (BuildContext context) {
          return QRResultSet(resultList[0]);
        }));
      }
    });
  }
}
