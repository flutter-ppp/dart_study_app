import 'dart:math';

import 'package:dart_study_app/ui/key/global_key_demo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

import 'geek/20/entry_main.dart';
import 'geek/22/animation_main.dart';
import "grammar/ext/ext_widget.dart";
import 'packages/flutter_treeview_demo.dart';
import 'ui/async/future_builder_demo.dart';
import 'ui/async/stream_builder_counter_demo.dart';
import 'ui/async/stream_builder_demo.dart';
import 'ui/key/key_demo1.dart';
import 'ui/key/key_demo2.dart';
import 'ui/lifecycle/lifecycle_watcher.dart';

void main() {
  runApp(MyApp());
}

final List<Widget> widgets = [
  FutureBuildDemoWidget(),
  StreamBuilderCounterDemoWidget(),
  LifecycleWatcher(),
  FlutterTreeViewWidgetDemo(),
  SteamBuilderDemoWidget(),
  HomePage20(),
  HomePage22(),
  KeyDemo1Page(),
  KeyDemo2Page(),
  GlobalKeyDemo2Page()
];

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ui
//    final Widget _widget = ImageDecorationWidget();

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    var originLists = <Widget>[
      Text(
        'You have pushed the button this many times:',
      ),
      Text(
        '$_counter',
        style: Theme.of(context).textTheme.headline4,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView(
        children: widgets
            .map((e) => ItemWidget(e.toStringShort(), () {
                  e.pushTo(context);
                }))
            .toList(),
      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ItemWidget extends StatelessWidget {
  final String name;
  final VoidCallback cb;

  ItemWidget(this.name, this.cb);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        name,
        style: TextStyle(color: Colors.black, fontSize: 20),
      ),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, Random().nextInt(256),
              Random().nextInt(256), Random().nextInt(256))),
      height: 60,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(8),
    ).addTapListener(cb);
  }
}
