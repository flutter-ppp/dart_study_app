// Copyright (c) 2015, the Dart project authors.
// Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:io';

// https://dart.cn/tutorials/language/streams

// Stream 是一系列异步事件的序列。其类似于一个异步的 Iterable
Future<int> sumStream(Stream<int> stream) async {
  var sum = 0;
  await for (var value in stream) {
    print("receive value: $value");
    sum += value;
  }
  return sum;
}

Stream<int> countStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    sleep(Duration(seconds: 2));
    yield i;
  }
}

main() async {
  var stream = countStream(10);
  print("1");
  var sum = await sumStream(stream);
  print("2");
  print(sum); // 55
}
