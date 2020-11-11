import 'package:flutter/material.dart';

import 'data.dart';
import 'widgets.dart';

class ApmTreePerformanceDemoWidget extends StatefulWidget {
  @override
  createState() => ApmTreePerformanceDemoWidgetState();
}

class ApmTreePerformanceDemoWidgetState
    extends State<ApmTreePerformanceDemoWidget> {
  var promoAmount = 0;

  @override
  void initState() {
    super.initState();

    promotions.listen((amount) {
      if (mounted) setState(() => promoAmount = amount);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('小店'),
        ),
        body: ListView(children: [
          MyCard(
              height: 240.0, color: Colors.blue[600], child: const Label('新货')),
          SizedBox(
              height: 150.0,
              child: ListView(scrollDirection: Axis.horizontal, children: [
                MyCard(
                    width: 120.0,
                    color: Colors.red[700],
                    child: const Label('家具')),
                MyCard(
                    width: 200.0,
                    color: Colors.green,
                    child: const Label('唱片')),
                MyCard(
                    width: 160.0,
                    color: Colors.amber[600],
                    child: const Label('单车')),
                MyCard(
                    width: 240.0, color: Colors.teal, child: const Label('眼镜')),
                MyCard(
                    width: 180.0, color: Colors.pink, child: const Label('西瓜')),
              ])),
          MyCard(
              height: 160.0,
              color: Colors.indigo,
              child: Stack(children: [
                Align(
                    alignment: Alignment.topLeft,

// terrible
                    child: CounterChip(child: Text(promoAmount.toString()))),
//                    child: BadgeWidget()),
                const Label('抢购!')
              ])),
        ]));
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class BadgeWidget extends StatefulWidget {
  @override
  _BadgeWidgetState createState() => _BadgeWidgetState();
}

class _BadgeWidgetState extends State<BadgeWidget> {
  var promoAmount = 0;

  Stream _stream;

  @override
  void initState() {
    super.initState();
    _stream = Stream.periodic(const Duration(seconds: 1), (count) => count);

    _stream.listen((amount) {
      if (mounted) setState(() => promoAmount = amount);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CounterChip(child: Text(promoAmount.toString()));
  }
}
