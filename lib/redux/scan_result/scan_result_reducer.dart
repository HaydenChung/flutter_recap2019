import 'package:recap2019/redux/scan_result/scan_result_actions.dart';
import "package:redux/redux.dart";
import 'package:recap2019/redux/scan_result/ScanResultState.dart';
import 'package:recap2019/local_storage/ScanResultStorage.dart';

final scanResultReducer = combineReducers<ScanResultState> ([
  TypedReducer<ScanResultState, AddResultAction>(_addResult),
  TypedReducer<ScanResultState, RemoveResultAction>(_removeResult)
]);

ScanResultState _addResult(ScanResultState state, AddResultAction action) {
  ScanResultState _state =  state.copyWith();
  ScanResultStorage storage = ScanResultStorage();
  storage.addValue(action.newResult);
  _state.scanResult.add(action.newResult);
  return _state;
}

ScanResultState _removeResult(ScanResultState state, RemoveResultAction action) {
  ScanResultState _state = state.copyWith();
  _state.scanResult.removeAt(action.ind);
  return _state;
}