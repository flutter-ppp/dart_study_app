extension ExtMap on Map {
  Map<String, dynamic> putIfNoNull(String s, dynamic item) {
    if (item != null) {
      this[s] = item;
    }
    return this;
  }

  filterValueNull() => removeWhere((k, v) => v == null);

  operator []=(String key, dynamic value) {
    if (value != null) {
      this[key] = value;
    }
  }
}
