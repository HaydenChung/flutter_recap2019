import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

// import './QRResultSetModel.dart';
// import 'package:recap2019/redux/scan_result/scan_result_actions.dart';
// import 'package:recap2019/redux/app/AppState.dart';
// import 'package:recap2019/controller/QRScanner/QRResultSetWidgetModel.dart'

class QRResultSetWidget extends StatelessWidget {
  final String _data;
  final String _type;

  QRResultSetWidget(this._data, this._type);

  Widget build(BuildContext context) {
    String data = this._data;
    Widget innerInkWell; 


    if (this._type == 'phone') data = 'tel:' + data;
    if (this._type == 'email') data = 'mailto:' + data + '?subject=Subject';

    if (this._type == 'string') {
      innerInkWell = InkWell(
        child: SelectableText(this._data,
          style: TextStyle(
            fontSize: 25
          )
        ),
      );
    }else {
      innerInkWell = InkWell(
        child: SelectableText(this._data,
          style: TextStyle(
            decoration: TextDecoration.underline,
            color: Colors.blue,
            fontSize: 25
          ),
          onTap: () {
            launch(data);
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scanned Result')
      ),
      body: Container(
        child: Center(
          child: Material(
            child: innerInkWell
          )
        )
      )
    );
  }

  _onLongPress() {
    Clipboard.setData(ClipboardData(text: this._data));
  }
}
