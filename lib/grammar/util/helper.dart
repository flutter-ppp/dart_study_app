import 'dart:convert';

final Wrapper util = Wrapper();

class Wrapper {
//  String getType(dynamic obj) => reflect(obj).type.reflectedType.toString();
  String getType(dynamic obj) => obj.runtimeType.toString();

  void println(dynamic o, {bool withTime = true}) {
    if (withTime) {
      var dateTime = DateTime.now();
      var time = "${dateTime.month}-${dateTime.day} "
          "${dateTime.hour}:${dateTime.minute}:${dateTime.second}.${dateTime.millisecond}";
      print("[$time]:\t${_stringifyMessage(o)}");
    } else {
      print(_stringifyMessage(o));
    }
  }

  String _stringifyMessage(dynamic message) {
    if (message is Map || message is Iterable) {
      var encoder = JsonEncoder.withIndent(null);
      return encoder.convert(message);
    } else {
      return message.toString();
    }
  }
}