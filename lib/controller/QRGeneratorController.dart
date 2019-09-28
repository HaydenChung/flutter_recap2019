import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'dart:async';

class QRGeneratorController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => QRGeneratorState();
}

class QRGeneratorState extends State<QRGeneratorController> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Generator')
      )
    );
  }
}