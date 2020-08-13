import 'dart:async';

void main() {
//  _doTest1();
//  _runZonedTest();
}

void _runZonedTest() {
  runZoned(() {
    //同步抛出异常
    throw StateError('This is a Dart exception.');
  }, onError: (dynamic e, StackTrace stack) {
    print('Sync error caught by zone');
  });
  
  runZoned(() {
    //异步抛出异常
    Future.delayed(Duration(seconds: 1))
        .then((e) => throw StateError('This is a Dart exception in Future.'));
  }, onError: (dynamic e, StackTrace stack) {
    print('Async error aught by zone');
  });
}

void _doTest1() {
  //使用try-catch捕获同步异常
  try {
    throw StateError('This is a Dart exception.');
  } catch (e) {
    print(e);
  }

  //使用catchError捕获异步异常
  Future.delayed(Duration(seconds: 1))
      .then((e) => throw StateError('This is a Dart exception in Future.'))
      .catchError((e) => print(e));

  //注意，以下代码无法捕获异步异常
  try {
    Future.delayed(Duration(seconds: 1))
        .then((e) => throw StateError('This is a Dart exception in Future.'));
  } catch (e) {
    print("This line will never be executed. ");
  }
}
