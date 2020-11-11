// https://book.flutterchina.club/chapter7/futurebuilder_and_streambuilder.html

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<String> mockNetworkData() async {
  return Future.delayed(Duration(seconds: 2), () => "我是从互联网上获取的数据");
}

class FutureBuildDemoWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FutureBuildDemoState();
}

class _FutureBuildDemoState extends State<FutureBuildDemoWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      color: Colors.white,
      child: FutureBuilder<String>(
          future: mockNetworkData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            print("on build: $snapshot");
            // 请求已结束
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                // 请求失败，显示错误
                return Text("Error: ${snapshot.error}");
              } else {
                // 请求成功，显示数据
                return Text("Contents: ${snapshot.data}");
              }
            } else {
              // 请求未结束，显示loading
              return CircularProgressIndicator();
            }
          }),
    ));
  }

}
