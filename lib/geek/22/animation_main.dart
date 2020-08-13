import 'package:dart_study_app/geek/20/count_container.dart';
import 'package:dart_study_app/geek/20/event_bus_page.dart';
import 'package:dart_study_app/geek/22/widget_animate_widget.dart';
import 'package:flutter/material.dart';

import 'builder_animate_widget.dart';
import 'hero_transition.dart';
import 'normal_animate_widget.dart';


class HomePage22 extends StatefulWidget {
  HomePage22({Key key, this.title = "HomePage22"}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomePage22State createState() => _HomePage22State();
}

class _HomePage22State extends State<HomePage22> {
  int count = 0;

  void _incrementCounter() => setState(() {
    count++;
  }); //修改计数器

  @override
  Widget build(BuildContext context) {
    //将CountContainer作为根节点，并使用0作为初始化count
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: TabBarView(
          children: [
            NormalAnimateWidget(),
            BuilderAnimateWidget(),
            WidgetAnimateWidget(),
            Page1()
          ],
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.home),text: "普通动画",),
            Tab(icon: Icon(Icons.rss_feed),text: "Builder动画",),
            Tab(icon: Icon(Icons.perm_identity),text: "Widget动画",),
            Tab(icon: Icon(Icons.message),text:'hero动画')
          ],
          unselectedLabelColor: Colors.blueGrey,
          labelColor: Colors.blue,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.red,
        ),
      ),
    );
  }
}
