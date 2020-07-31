import '../util/helper.dart';

void main() {
  doMapTest();
}

void doMapTest() {
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

  print("map.map...");
  var map2 = map.map((key, value) => MapEntry("$key-$key", value));
  map2.forEach((key, value) {
    print("key: $key : value: $value");
  });

  var list0 = map.keys.toList()[0];
  print("list0: $list0");

  list0 = map2.keys.toList()[0];
  print("list0: $list0");


}