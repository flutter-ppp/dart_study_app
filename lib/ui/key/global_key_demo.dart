import 'dart:math';

import 'package:flutter/material.dart';

class GlobalKeyDemo2Page extends StatefulWidget {
  @override
  _GlobalKeyDemo2PageState createState() => _GlobalKeyDemo2PageState();
}

class _GlobalKeyDemo2PageState extends State<GlobalKeyDemo2Page> {
  final List<String> _names = ["1", "2", "3", "4", "5", "6", "7"];
  final GlobalKey<_KeyItemLessWidgetState> globalKeyTest = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("Key demo"),
      ),
      body: Column(
        children: <Widget>[
          KeyItemLessWidget(
            "哈啰出行",
            key: globalKeyTest,
          ),
          KeyItemLessWidget(
            "晓黑板APP",
            key: UniqueKey(),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          print(globalKeyTest.currentState.widget.name);
        },
      ),
    );
  }
}

class KeyItemLessWidget extends StatefulWidget {
  final String name;

  KeyItemLessWidget(this.name, {Key key}) : super(key: key);

  @override
  _KeyItemLessWidgetState createState() => _KeyItemLessWidgetState();
}

class _KeyItemLessWidgetState extends State<KeyItemLessWidget> {
  final randColor = Color.fromARGB(
      255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        widget.name,
        style: TextStyle(color: Colors.white, fontSize: 50),
      ),
      height: 80,
      color: randColor,
    );
  }
}
