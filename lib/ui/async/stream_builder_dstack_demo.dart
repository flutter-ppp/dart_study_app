import 'dart:async';

import 'package:flutter/material.dart';

class StackWidgetStreamItem {
  final String route;
  final Map params;

  StackWidgetStreamItem({this.params, this.route});
}

class DStackWidgetStream {
  factory DStackWidgetStream() => _getInstance();

  static DStackWidgetStream get instance => _getInstance();
  static DStackWidgetStream _instance;

  DStackWidgetStream._internal();

  StreamController<StackWidgetStreamItem> pageStreamController;

  Stream<StackWidgetStreamItem> get pageStream => pageStreamController.stream;

  static DStackWidgetStream _getInstance() {
    if (_instance == null) {
      _instance = DStackWidgetStream._internal();
      _instance.pageStreamController = StreamController();
    }
    return _instance;
  }

  void dispose() {
    pageStreamController?.close();
  }
}

class StreamDemoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: DStackWidgetStream.instance.pageStream,
        builder: (BuildContext context,
            AsyncSnapshot<StackWidgetStreamItem> snapshot) {
          print("streamBuilder: builder...");
          return Container();
        });
  }
}
