import "package:redux/redux.dart";
import 'package:recap2019/redux/route/RouteState.dart';
import 'package:recap2019/redux/route/route_actions.dart';

final routeReducer = combineReducers<RouteState>([
  TypedReducer<RouteState, ChangePageAction>(_pageIndex)
]);

RouteState _pageIndex(RouteState state, ChangePageAction action) {
  return state.copyWith(pageIndex: action.pageIndex);
}