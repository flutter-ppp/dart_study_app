import 'dart:async';
import 'dart:io';

import 'package:dart_study_app/grammar/util/helper.dart';

void main() async {
  util.println("1");
  doMockCompleter();
  util.println("2");
  var future = _getNumber();
  util.println(future.runtimeType.toString());
  util.println("---");
  var i = await future;
  var j = await future;
  var k = await future;

  util.println("$i $j $k");
  util.println("3");
}

Future<int> doMockCompleter() async {
  util.println("doMockCompleter start");

  sleep(Duration(seconds: 2));
  Completer<int> completer = Completer.sync();
  completer.complete(10);
  return completer.future;
}

Future<int> _getNumber() async {
  sleep(Duration(seconds: 5));
  return 1000;
}
