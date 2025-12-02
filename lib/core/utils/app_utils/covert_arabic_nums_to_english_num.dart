bool containsArabicNumbers(String input) {
  final arabicNumRegex = RegExp(r'[٠-٩]');
  return arabicNumRegex.hasMatch(input);
}

String convertArabicToEnglishNumbers(String input) {
  const arabicToEnglishMap = {
    '٠': '0',
    '١': '1',
    '٢': '2',
    '٣': '3',
    '٤': '4',
    '٥': '5',
    '٦': '6',
    '٧': '7',
    '٨': '8',
    '٩': '9',
  };

  String result = input;
  arabicToEnglishMap.forEach((arabic, english) {
    result = result.replaceAll(arabic, english);
  });

  return result;
}
