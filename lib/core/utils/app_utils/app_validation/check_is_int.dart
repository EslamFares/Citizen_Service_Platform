// ignore_for_file: unused_local_variable

bool isInteger(String value) {
  if (isNumeric(value)) {
    // Check if the string represents an integer without leading zeros (except "0").
    final regex = RegExp(r'^-?\d+$');
    // Matches optional negative sign followed by digits.
    if (!regex.hasMatch(value)) {
      return false;
    }
    return true;
  }
  return false;
}

bool isNumeric(String str) {
  try {
    var value = double.parse(str);
  } on FormatException {
    return false;
  } on Exception {
    return false;
  } catch (e) {
    return false;
  }
  return true;
}
