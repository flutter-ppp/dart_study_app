import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StreamBuilderCounterDemoWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StreamBuilderCounterDemoState();
}

class _StreamBuilderCounterDemoState
    extends State<StreamBuilderCounterDemoWidget> {
  CountTime _countTime;
  VoidCallback onclick;

  @override
  void initState() {
    _countTime = CountTime(maxSecond: 60);
    onclick = () {
      _countTime.startCount();
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _countTime.countTimeStream,
        initialData: 0,
        builder: (context, snap) {
          print("on builder: $snap");

          var buttonText;
          if (snap.data == 0) {
            onclick = () {
              _countTime.startCount();
            };
            buttonText = '发送验证码';
          } else {
            onclick = null;
            buttonText = '${snap.data} 秒后可以再次发送';
          }
          return FlatButton(
            onPressed: onclick,
            child: Text(buttonText),
            color: Colors.lightBlue,
            textColor: Colors.white,
            disabledColor: Colors.grey,
            disabledTextColor: Colors.white30,
          );
        });
  }

  @override
  void dispose() {
    _countTime?.dispose();
    super.dispose();
  }
}

class CountTime {
  StreamController<int> _controller;
  final int maxSecond;

  CountTime({this.maxSecond = 60}) {
    _controller = StreamController();
  }

  Stream<int> get countTimeStream => _controller.stream;

  ///
  /// 开始倒计时
  ///
  startCount() async {
    if (maxSecond <= 0) {
      return;
    }
    for (var i = maxSecond; i >= 0; i--) {
      Duration duration;
      if (i == maxSecond) {
        duration = Duration(seconds: 0);
      } else {
        duration = Duration(seconds: 1);
      }
      await Future.delayed(duration, () {
        return i;
      }).then((s) {
        _controller.sink.add(s);
      });
    }
  }

  dispose() {
    _controller.close();
  }
}
