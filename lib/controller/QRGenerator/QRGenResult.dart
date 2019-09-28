import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// import 'package:share/share.dart';

class QRGenResult extends StatelessWidget {

  final String _input;

  QRGenResult(this._input);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Preview QR Code"),
        actions: <Widget> [
          IconButton(
            icon: Icon(
              MdiIcons.shareVariant
            ),
            onPressed: (){
              // Share.share('Sharing');
            },
          )
        ]
      ),
      body: Container(
        child: LayoutBuilder(
          builder: (context, constraint) {
            return Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Positioned(
                    left: (constraint.biggest.width/2)  - (constraint.biggest.width - 100)/2,
                    top: (constraint.biggest.height/2) - (constraint.biggest.width - 100)/2,
                    child: RepaintBoundary(
                      // key: _qrWidgetKey,
                      child: new QrImage(
                          data: _input,
                          size: constraint.biggest.width - 100,
                          errorStateBuilder: (BuildContext context, error) => Text("[QR] ERROR - {$error}")
                          // (ex) {
                          //   print("[QR] ERROR - {$ex}");
                          // }
                        ),
                    )
                  ),
              ]
            );
          }
        ),
      )
    );
  }
}