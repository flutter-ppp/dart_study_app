typedef ForEachWithIndex = Function(int position, dynamic);

extension ExtList on List {
  forEachWithIndex(ForEachWithIndex forEachWithIndex) {
    for (int i = 0; i < this.length; i++) {
      forEachWithIndex(i, this[i]);
    }
  }
}
