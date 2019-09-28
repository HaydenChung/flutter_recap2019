import 'package:redux/redux.dart';
import 'package:recap2019/redux/app/AppState.dart';
import 'package:recap2019/redux/scan_result/scan_result_actions.dart';

class ResultListDrawerModel {

  final Function (int resultIndex) removeResult;
  final List<String> resultList;

  ResultListDrawerModel({
    this.removeResult,
    this.resultList
  });

  static ResultListDrawerModel formStore(Store<AppState> store) {
    return ResultListDrawerModel(
      removeResult: (resultIndex)=> store.dispatch(RemoveResultAction(resultIndex)),
      resultList: store.state.scanResultState.scanResult
    );
  }

}