import 'package:dart_study_app/grammar/ext/ext_list.dart';

void main() {
  var a = {"1", "2", "3", "aaa", "bbb"};
  print(a.runtimeType.toString());
  var list = a.toList();
  print(list.runtimeType.toString());

  list.forEachWithIndex((position, item) => {print("[$position : $item]")});
}
