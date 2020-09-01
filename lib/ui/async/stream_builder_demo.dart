// 我们创建一个计时器的示例：每隔1秒，计数加1。这里，我们使用Stream来实现每隔一秒生成一个数字:
// 本示例只是为了演示StreamBuilder的使用，在实战中，凡是UI会依赖多个异步数据而发生变化的场景都可以使用StreamBuilder。
import 'package:flutter/material.dart';

Stream<int> counter() {
  return Stream.periodic(Duration(seconds: 1), (i) {
    return i;
  });
}

class SteamBuilderDemoWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SteamBuilderDemoState();
}

class _SteamBuilderDemoState extends State<SteamBuilderDemoWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: counter(), //
      //initialData: ,// a Stream<int> or null
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        if (snapshot.hasError) return Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text('没有Stream');
          case ConnectionState.waiting:
            return Text('等待数据...');
          case ConnectionState.active:
            return Text('active: ${snapshot.data}');
          case ConnectionState.done:
            return Text('Stream已关闭');
        }
        return null; // unreachable
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
