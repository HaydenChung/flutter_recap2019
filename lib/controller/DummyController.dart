import 'package:flutter/material.dart';

class DummyController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Text('Dummy Screen'),
    );
  }
}