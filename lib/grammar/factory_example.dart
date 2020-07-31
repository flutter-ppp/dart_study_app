import 'package:dart_study_app/grammar/model/animal.dart';
import 'package:dart_study_app/grammar/model/bean.dart';

void main() {
  var p1 = Logger("1");
  var p2 = Logger('22');
  var p3 = Logger('1'); // 相同对象直接访问缓存

  //identical会对两个对象的地址进行比较，相同返回true，
  //等同于 == ，好处是如果重写了==，那用identical 会更方便。
  print(identical(p1, p3));

  var cat = new Animal("cat", "wiki");
  var dog = new Animal("dog", "baobao");
  cat.getNoise();
  dog.getNoise();

  /// 单例模式
}
