final Wrapper util = Wrapper();

class Wrapper {
//  String getType(dynamic obj) => reflect(obj).type.reflectedType.toString();
  String getType(dynamic obj) => obj.runtimeType.toString();
}
