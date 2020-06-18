extension EnumsExtenstion on Object {
  String asString() => toString().split('.').last;

  String splitString() {
    var val = this.asString().split('_');
    String fullString = '';
    val.forEach((element) {
      fullString += '$element ';
    });
    return fullString;
  }
}

extension CapExtenstion on String {
  String get firstLetterCapital =>
      '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCapital => this.toUpperCase();
  String get allInLower => this.toLowerCase();
}
