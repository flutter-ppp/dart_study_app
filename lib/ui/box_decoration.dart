// https://blog.csdn.net/u014112893/article/details/107819564

import 'package:flutter/material.dart';

class ImageDecorationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ImageDecorationState();
}

class _ImageDecorationState extends State<ImageDecorationWidget> {
  final Map _borderMap = {
    "border_symmetric": Border.symmetric(
        vertical: BorderSide(
          // 垂直方向（上、下）
          color: Colors.red,
          width: 5.0,
        ),
        horizontal: BorderSide(
          // 水平方向（左、右）
          color: Colors.orangeAccent,
          width: 5.0,
        )),
    "border": Border.all(color: Colors.cyan, width: 5)
  };

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
          color: Colors.blue,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "http://wx4.sinaimg.cn/mw690/6a04b428gy1fyrldlsv4yg204r05i3yt.gif")),
          border: _borderMap['border'],
          borderRadius: BorderRadius.all(Radius.circular(10))),
    ));
  }
}
