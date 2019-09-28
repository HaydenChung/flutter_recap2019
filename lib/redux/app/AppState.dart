import 'package:meta/meta.dart';
import 'package:recap2019/redux/route/RouteState.dart';
import 'package:recap2019/redux/scan_result/ScanResultState.dart';

//State object is immutable, everytime they initial will always require their property, by initial() or with the copyWith() method
@immutable
class AppState{

  final RouteState routeState;
  final ScanResultState scanResultState;
  // final QRScanState qrScanState;
  
  AppState({
    @required this.routeState,
    @required this.scanResultState
  });

  //factory key word before constructor will make sure the class return a new instance of current class, a singleton pattren
  factory AppState.initial() {
    return AppState(
      routeState: RouteState.initial(),
      scanResultState: ScanResultState.initial()
    );
  }

  //Check if new state is passed in or use the existing state, since this is a factory class *singleton, this.XXX will return the existing property.
  AppState copyWith({
    RouteState routeState,
    ScanResultState scanResultState
  }) {
    return AppState(
      routeState: routeState ?? this.routeState,
      scanResultState: scanResultState ?? this.scanResultState
    );
  }

  @override
  bool operator ==(Object other) =>
    identical(this, other) ||
      other is AppState &&
        routeState == other.routeState &&
        scanResultState == other.scanResultState;

  @override
  int get hashCode => 
    routeState.hashCode ^
    scanResultState.hashCode;

}