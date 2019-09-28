import 'package:flutter/material.dart';
import './QRResultSetWidget.dart';
import './QRResultSetModel.dart';

// import 'package:flutter_redux/flutter_redux.dart';
// import 'package:redux/redux.dart';
// import 'package:recap2019/redux/app/AppState.dart';
// import 'package:recap2019/redux/scan_result/scan_result_actions.dart';

class QRResultSet extends StatelessWidget{
  
  final String _scanInput;
  final Map<String, String> _regexMap = {
    'email': r'^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    'http': r'^(http|https)://',
    'phone': r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$'
  };

  QRResultSet(
    this._scanInput
  );

  String get data{
    return this._scanInput;
  }

  String get inputType{
    return this._regex(this._scanInput);
  }

  String _regex(String scanData) {

    String matchType = 'string';

    for(String key in this._regexMap.keys) {
      bool hasMatch = RegExp(this._regexMap[key]).hasMatch(scanData);
      if(hasMatch) {
        matchType =  key;
        break;
      }
    }

    return matchType;
  }

  Widget build(BuildContext context) {
    
    String type = this._regex(this.data);

    // return StoreConnector<AppState, QRResultSetModel>(
    //   converter: (store)=> QRResultSetModel.formStore(store),
    //   builder: (_, viewModel) {
        return QRResultSetWidget(this.data, type);
    // });
    
    // String type = this._regex(this.data);
    // return QRResultSetWidget(this.data, type);
  }

}