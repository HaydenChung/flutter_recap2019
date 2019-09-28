import 'package:redux/redux.dart';
import 'package:recap2019/redux/app/AppState.dart';
import 'package:recap2019/redux/scan_result/scan_result_actions.dart';

class QRResultSetModel {
  final Function (String newResult) addResult;
  final List<String> resultList;

  QRResultSetModel({
    this.addResult,
    this.resultList
  });

  static QRResultSetModel formStore(Store<AppState> store) {
    return QRResultSetModel(
      addResult: (newResult)=> store.dispatch(AddResultAction(newResult)),
      resultList: store.state.scanResultState.scanResult
    );
  }

}