import 'package:redux/redux.dart';
import 'package:recap2019/redux/app/AppState.dart';
import 'package:recap2019/redux/route/route_actions.dart';
import 'package:recap2019/redux/route/RouteState.dart';

class ScreenFactoryViewModel {
  final int routeIndex;

  ScreenFactoryViewModel({
    this.routeIndex
  });

  static ScreenFactoryViewModel formStore(Store<AppState> store) {
    return ScreenFactoryViewModel(
      routeIndex: store.state.routeState.pageIndex
    );
  }
}