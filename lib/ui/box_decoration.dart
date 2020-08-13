// https://blog.csdn.net/u014112893/article/details/107819564

import 'package:flutter/material.dart';

class ImageDecorationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ImageDecorationState();
}

class _ImageDecorationState extends State<ImageDecorationWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(image: NetworkImage(
                  "http://wx4.sinaimg.cn/mw690/6a04b428gy1fyrldlsv4yg204r05i3yt.gif"))),
        ));
  }

}