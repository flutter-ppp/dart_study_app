/// TODO, throw e vs rethrow
/// https://dart.cn/guides/language/effective-dart/usage#functions


void main() {
  try {
    _captureError();
  } catch (e) {
    print("outer:$e");
  }
}

void _captureError() {
  try {
    _mockError();
  } catch (e) {
    print(e.runtimeType.toString());
    print("_captureError:$e");
    throw e;
  }
}

/// dart中，null是一个普通的Null类型对象
void _mockError() {
  var a;
  print(a.runtimeType.toString());
  print(a++);
}

void _spanError(NoSuchMethodError e) {}
