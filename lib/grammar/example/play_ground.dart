class Response {
  int code; // 业务的 code
  var data; // data 节点数据
  final String error; //  错误信息

  Response(this.code, {this.data, this.error});

  @override
  String toString() {
    return '''
    code: $code,
    data: $data,
    error: $error
    ''';
  }
}

void main() {
  var result = {
    "code": 1,
    "desc": {"name": "jacky"}
  };

  var response = Response(result['code'], error: result['desc']?.toString());

  print("$response");
}
