import 'package:meta/meta.dart';

@immutable
class RouteState{

  // final String pageName;
  final int pageIndex;

  RouteState({
    // @required this.pageName,
    @required this.pageIndex
  });

  factory RouteState.initial() {
    return RouteState(
      pageIndex: 0,
      // pageName: ''
      );
  }

  RouteState copyWith({
    // String pageName,
    int pageIndex
  }) {
    return RouteState(
      // pageName: pageName ?? this.pageName,
      pageIndex: pageIndex ?? this.pageIndex
    );
  }

  @override
  bool operator ==(Object other) =>
    identical(this, other) ||
      other is RouteState &&
        // this.pageName == other.pageName &&
        this.pageIndex == other.pageIndex;

  @override
  int get hashCode =>
    // this.pageName.hashCode ^
    this.pageIndex.hashCode;
}