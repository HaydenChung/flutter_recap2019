// import 'dart:async';
import 'package:redux/redux.dart';
import 'package:recap2019/redux/app/app_reducer.dart';
import 'package:recap2019/redux/app/AppState.dart';

Store<AppState> createStore() {
  return Store(
    appReducer,
    initialState: AppState.initial()
  );
}