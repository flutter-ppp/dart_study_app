import 'package:dart_study_app/grammar/model/bean.dart';

void main() {
  test();
//  test2();
}

void test2() {
  var s1 = Singleton2.instance;
  var s2 = Singleton2.instance;
  var s3 = Singleton2.instance;
  
  print(identical(s1, s2));
  print(identical(s2, s3));
}

void test() {
  Singleton();
  Singleton();
  Singleton();
  Singleton();

  Singleton3.instance;
  Singleton3.instance;
  Singleton3.instance;

  var s1 = Singleton();
  var s2 = Singleton();
  print(identical(s1, s2));
}
