import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: MyHomePage(),
      );
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final none = [
    for (int i = 0; i < 7; i++) [for (int j = 0; j < 9; j++) false]
  ];

  final some = [
    [true, true, true, true, false, false, true, true, false],
    [true, false, false, false, false, true, false, false, true],
    [true, true, true, false, false, true, false, false, true],
    [false, false, false, true, false, true, false, false, true],
    [false, false, false, true, false, true, false, false, true],
    [false, false, false, true, false, true, false, false, true],
    [true, true, true, false, false, false, true, true, false],
  ];

  var vals = [
    for (int i = 0; i < 7; i++) [for (int j = 0; j < 9; j++) false]
  ];

  var displayed = false;

  void printState() {
    String s = "finals some = [";
    for (int i = 0; i < 7; i++) {
      String t = "";
      for (int j = 0; j < 9; j++) t += "${vals[i][j]} ${j < 8 ? "," : ""} ";
      s += "[$t],\n";
    }
    s += "];";
    print(s);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          for (int i = 0; i < 7; i++)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for (int j = 0; j < 9; j++)
                  CupertinoSwitch(
                    value: vals[i][j],
                    onChanged: (value) {
                      setState(() {
                        vals = displayed ? some : none;
                        displayed = !displayed;
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
}
