abstract class Animal {
  String name;

  void getNoise();

  factory Animal(String type, String name) {
    switch (type) {
      case "cat":
        return new Cat(name);
      case "dog":
        return new Dog(name);
      default:
        throw "The '$type' is not an animal";
    }
  }
}

class Cat implements Animal {
  String name;

  Cat(this.name);

  @override
  void getNoise() {
    print("${this.name}: mew~");
  }
}

class Dog implements Animal {
  String name;

  Dog(this.name);

  @override
  void getNoise() {
    print("${this.name}: wang~");
  }
}
