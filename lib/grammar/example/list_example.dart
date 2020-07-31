import '../util/helper.dart';

/// 集合 测试
/// mapping
/// list
///
void main() {
  var names = {"hello","jacky","alice"};

  /// tear-off 写法
  /// good
  names.forEach(print);

  /// bad
  names.forEach((name) {
    print(name);
  });
}