import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(SwitchDisplayApp());

class SwitchDisplayApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(home: SwitchDisplay());
}

class SwitchDisplay extends StatefulWidget {
  SwitchDisplay({Key key}) : super(key: key);

  @override
  _SwitchDisplayState createState() => _SwitchDisplayState();
}

class _SwitchDisplayState extends State<SwitchDisplay> {
  static const _rows = 7;
  static const _cols = 9;

  var _vals = [
    for (int i = 0; i < _rows; i++)
      [
        for (int j = 0; j < _cols; j++) false,
      ]
  ];

  final _none = toBool([for (int j = 0; j < _cols; j++) ""]);

  final List<List<bool>> _fiveZero = toBool([
                                              "1111  11 ",
                                              "1    1  1",
                                              "111  1  1",
                                              "   1 1  1",
                                              "   1 1  1",
                                              "   1 1  1",
                                              "111   11 ",
                                            ]);

  var _displayed = false;

  @override
  Widget build(BuildContext context) {
    var rows = _rows;
    var cols = isPortrait(context) ? 4 : _cols;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          for (int i = 0; i < rows; i++)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for (int j = 0; j < cols; j++)
                  CupertinoSwitch(
                    value: _vals[i][j],
                    onChanged: (value) {
                      setState(() {
                        _vals = _displayed ? _fiveZero : _none;
                        _displayed = !_displayed;
                        //_vals[i][j] = !_vals[i][j];
                      });
                    },
                    ),
              ],
              ),
        ],
        ),
      );
  }

  String printState() {
    String str = "[";
    for (int i = 0; i < _rows; i++) {
      String row = "";
      for (int j = 0; j < _cols; j++)
        row += "${_vals[i][j]} ${j < _cols - 1 ? "," : ""} ";
      str += "[$row],\n";
    }
    str += "];";
    return str;
  }

  static bool isPortrait(BuildContext context) =>
      MediaQuery
          .of(context)
          .orientation == Orientation.portrait;

  static List<List<bool>> toBool(List<String> strs) =>
      [
        for (int i = 0; i < strs.length; i++)
          [
            for (int j = 0; j < _cols; j++) strs[i].padRight(_cols)[j] != " ",
          ]
      ];
}
