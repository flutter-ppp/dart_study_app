import 'dart:math';

import 'package:flutter/material.dart';

class KeyDemo1Page extends StatefulWidget {
  @override
  _KeyDemo1PageState createState() => _KeyDemo1PageState();
}

class _KeyDemo1PageState extends State<KeyDemo1Page> {
  List<Widget> tiles = [
    _StatefulColorfulTile(key: UniqueKey()),
    _StatefulColorfulTile(key: UniqueKey()),
  ];

  @override
  void initState() {
    super.initState();
    print("_KeyDemo1PageState#initState");
  }

  Widget _itemForRow(BuildContext context, int index) {
    return tiles[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("Key demo"),
      ),
      body: Column(
        children: tiles,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          setState(() {
            tiles.insert(1, tiles.removeAt(0));
          });
        },
      ),
    );
  }
}

class _StatelessColorfulTile extends StatelessWidget {
  final Color myColor = Color.fromARGB(
      255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));

  @override
  Widget build(BuildContext context) {
    return Container(
        color: myColor, child: Padding(padding: EdgeInsets.all(70.0)));
  }
}

class _StatefulColorfulTile extends StatefulWidget {
  _StatefulColorfulTile({Key key}) : super(key: key);

  @override
  _StatefulColorfulTileState createState() => _StatefulColorfulTileState();
}

class _StatefulColorfulTileState extends State<_StatefulColorfulTile> {
  Color myColor = Color.fromARGB(
      255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));

  @override
  Widget build(BuildContext context) {
    return Container(
        color: myColor, child: Padding(padding: EdgeInsets.all(70.0)));
  }
}
