import 'dart:async';
import 'package:recap2019/service/BottomNavEvent.dart';

class BottomNavBloc {
  int _index = 0;


  final _navStateController = StreamController<int>();
  StreamSink<int> get _inIndex => _navStateController.sink;
  Stream<int> get pageIndex => _navStateController.stream;

  final _navEventController = StreamController<SetBottomNavEvent>();
  
  Sink<SetBottomNavEvent> get bottomNavEventSink  => _navEventController.sink;

  BottomNavBloc() {
    _navEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(SetBottomNavEvent event) {
    _inIndex.add(event.value);
  }

  dispose() {
    _navStateController.close();
  }
}