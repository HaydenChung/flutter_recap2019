import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class QRScannerController extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => QRScannerState();

}

class QRScannerState extends State<QRScannerController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('QRScanner')
      )
    );
  }
}

