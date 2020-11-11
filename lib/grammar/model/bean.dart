import 'dart:math';

import 'package:dart_study_app/grammar/util/helper.dart';

class Logger {
  final String name;

  // 缓存已创建的对象
  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    // 不理解putIfAbsent可以查看文末的简述
    return _cache.putIfAbsent(name, () => Logger._internal(name));
  }

  // 私有的构造函数
  Logger._internal(this.name) {
    print("生成新实例：$name");
  }
}

/// https://juejin.im/post/6844903793373478919
/// 饿汉模式
class Singleton {
  // 单例公开访问点
  factory Singleton() => _instance;

  // 静态私有成员，没有初始化
  static final Singleton _instance = Singleton._();

  // 私有构造函数
  Singleton._() {
    util.println("singleton initEd");
  }
}

class Singleton2 {
  static Singleton2 instance = Singleton2._h();

  // 私有构造函数
  Singleton2._h() {
    util.println("singleton2 initEd");
  }
}

class Singleton3 {
  static final Singleton3 _instance = Singleton3();
  static var count = 1;
  static var person = Person(2016);

  static Singleton3 get instance {
    var c = count++;
    person = Person(2000);
    util.println("person random:${person.random}");
    util.println("LaLa count:=>$c");
    return _instance;
  }
}

class Person {
  final int birth;
  int age;
  final int random = Random().nextInt(256);

  Person(this.birth) {
    age = 2000 - birth;
  }
}
