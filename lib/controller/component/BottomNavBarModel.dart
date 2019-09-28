import 'package:redux/redux.dart';
import 'package:recap2019/redux/app/AppState.dart';
import 'package:recap2019/redux/route/route_actions.dart';

class BottomNavBarModel {
  final Function(int index) changeIndex;
  final int routeIndex;

  BottomNavBarModel({
    this.changeIndex,
    this.routeIndex
  });

  static BottomNavBarModel formStore(Store<AppState> store) {
    return BottomNavBarModel(
      changeIndex: (index)=> store.dispatch(ChangePageAction(index)),
      routeIndex: store.state.routeState.pageIndex
    );
  }
}