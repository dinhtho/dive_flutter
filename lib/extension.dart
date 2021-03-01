extension ExtendedString on String {
  String value() {
    return this ?? "";
  }
}
