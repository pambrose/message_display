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
  var vals = [
    for (int i = 0; i < 7; i++)
      [
        for (int j = 0; j < 9; j++) false,
      ]
  ];

  final none = [
    for (int i = 0; i < 7; i++)
      [
        for (int j = 0; j < 9; j++) false,
      ]
  ];

  final List<List<bool>> fiveZero = intToBool([
                                                [1, 1, 1, 1, 0, 0, 1, 1, 0],
                                                [1, 0, 0, 0, 0, 1, 0, 0, 1],
                                                [1, 1, 1, 0, 0, 1, 0, 0, 1],
                                                [0, 0, 0, 1, 0, 1, 0, 0, 1],
                                                [0, 0, 0, 1, 0, 1, 0, 0, 1],
                                                [0, 0, 0, 1, 0, 1, 0, 0, 1],
                                                [1, 1, 1, 0, 0, 0, 1, 1, 0],
                                              ]);

  var displayed = false;

  @override
  Widget build(BuildContext context) =>
      Scaffold(
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
                          vals = displayed ? fiveZero : none;
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

  String printState() {
    String str = "[";
    for (int i = 0; i < 7; i++) {
      String row = "";
      for (int j = 0; j < 9; j++)
        row += "${vals[i][j]} ${j < 8 ? "," : ""} ";
      str += "[$row],\n";
    }
    str += "];";
    return str;
  }

  static List<List<bool>> intToBool(List<List<int>> ints) =>
      [
        for (int i = 0; i < ints.length; i++)
          [
            for (int j = 0; j < ints[i].length; j++) ints[i][j] == 1,
          ]
      ];
}
