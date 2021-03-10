extension ExtendedString on String {
  String value() {
    return this ?? "";
  }
}

extension ExtendedObject on Object {
  delay(int milliseconds, Function function) {
    Future.delayed(Duration(milliseconds: milliseconds), function);
  }
}
