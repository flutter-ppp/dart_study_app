import 'package:dart_study_app/grammar/util/helper.dart';

class FieldDemo {
  bool isFlag;

  FieldDemo() {
    print("construct");
  }

  set flag(bool isFlag) {
    this.isFlag = isFlag;
  }

  @override
  String toString() {
    return 'FieldDemo{isFlag: $isFlag}';
  }
}

void main() {
  var s1 = FieldDemo();
  FieldDemo();
  FieldDemo();

  var fieldDemo = FieldDemo();

  util.println(identical(s1, fieldDemo));
  util.println(fieldDemo.toString());

  fieldDemo.flag = true;
  util.println(fieldDemo.toString());
}
