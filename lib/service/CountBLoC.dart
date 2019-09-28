import 'dart:async';

class CountBloC {
  int _count = 0;
  StreamController<int> _countController = StreamController<int>();

  // CountBLoC() {
  //   _count = 0;
  //   _countController = StreamController<int>();
  // }

  Stream<int> get value => _countController.stream;

  increment() {
    _countController.sink.add(++_count);
  }

  dispose() {
    _countController.close();
  }

}