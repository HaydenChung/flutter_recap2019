// import "package:meta/meta.dart";
import "package:recap2019/redux/app/AppState.dart";
import "package:recap2019/redux/route/route_reducer.dart";
import "package:recap2019/redux/scan_result/scan_result_reducer.dart";
//Always return a new AppState
AppState appReducer(AppState state, dynamic action) => 
  AppState(
    routeState: routeReducer(state.routeState, action),
    scanResultState: scanResultReducer(state.scanResultState, action)
  );