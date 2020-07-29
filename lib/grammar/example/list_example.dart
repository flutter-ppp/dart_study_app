import '../util/helper.dart';

/// 集合 测试
/// mapping
/// list
///
void main() {
  doMap();
}

// map 测试
void doMap() {
  var map = {"name": "jacky", "age": 10};
  if (map.containsKey("name")) {
    print("containsKey: name: ${map["name"]}");
  }
  print("name: ${map["name"]}");
  print("age: ${map["age"]}");
  print("school: ${map["school"]}");

  map.values.toList().forEach((element) {
    print(element);
  });

  print("--------------");
  var a;

  var data = a?.data ?? {};
  print("type:${util.getType(data)}");

  var b = {};
  print("type:${util.getType(b)}");
}
