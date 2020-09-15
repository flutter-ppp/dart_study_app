enum DLifeCycleState { create, foreground, background }

// 枚举测试
void main() {
  Map params = new Map();
  params['create'] = 1;
  var value = DLifeCycleState.values[params['create']];
  print("==$value");
}
