import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// https://juejin.im/post/6845166891573444616
class KeyDemo2Page extends StatefulWidget {
  @override
  _KeyDemo2PageState createState() => _KeyDemo2PageState();
}

class _KeyDemo2PageState extends State<KeyDemo2Page> {
  final List<String> _names = ["1", "2", "3", "4", "5", "6", "7"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("Key demo"),
      ),
      body: ListView(
        children: _names.map((item) {
          return KeyItemLessWidget(
            item,
            key: ValueKey(item),
//            key: UniqueKey(),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          setState(() {
            _names.removeAt(0);
          });
        },
      ),
    );
  }
}

class KeyItemLessWidget extends StatefulWidget {
  final String name;

  KeyItemLessWidget(this.name, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _KeyItemLessWidgetState();
}

class _KeyItemLessWidgetState extends State<KeyItemLessWidget> {
  final randColor = Color.fromARGB(
      255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        widget.name + ":${widget.toString()}",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      height: 80,
      color: randColor,
      alignment: AlignmentDirectional.centerStart,
    );
  }
}
