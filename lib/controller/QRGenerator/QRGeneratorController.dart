import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:async';

import 'package:recap2019/controller/QRGenerator/QRGenResult.dart';

class QRGeneratorController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRGeneratorState();
}

class _QRGeneratorState extends State<QRGeneratorController> {

  String _inputValue = "";

  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: new Padding(
          padding: EdgeInsets.all(50.0),
          child: Align(
            alignment: FractionalOffset(0.5, 0.7),
              child: new TextField(
                onChanged: (text) => _inputValue = text,
                decoration: new InputDecoration(
                  hintText: 'Copy and paste your text here.',
                  border: OutlineInputBorder()),
                textInputAction: TextInputAction.done,
                maxLength: 5000,
                maxLines: 8,
                onSubmitted: _onTextFieldSubmit
            ),
          )
        )
      )
    );
  }

  void _onTextFieldSubmit(value) {
    Navigator.of(context)
    .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      return QRGenResult(value);
    }));
  }
}