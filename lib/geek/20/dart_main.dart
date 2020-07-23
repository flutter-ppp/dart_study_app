import 'package:dart_study_app/geek/20/count_container.dart';
import 'package:flutter/material.dart';

class HomePage20 extends StatefulWidget {
  HomePage20({Key key, this.title = "HomePage20"}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomePage20State createState() => _HomePage20State();
}

class _HomePage20State extends State<HomePage20> {
  int count = 0;

  void _incrementCounter() => setState(() {
        count++;
      }); //修改计数器

  @override
  Widget build(BuildContext context) {
    //将CountContainer作为根节点，并使用0作为初始化count
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            CounterPage(),
//            NotificationWidget(),
//            FirstPage(),
          ],
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.home),
              text: "InheritedWidget",
            ),
//            Tab(
//              icon: Icon(Icons.rss_feed),
//              text: "Notification",
//            ),
//            Tab(
//              icon: Icon(Icons.perm_identity),
//              text: "EventBus",
//            )
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
