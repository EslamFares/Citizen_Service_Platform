import 'dart:developer';

class NumberToWordConverter {
  String numberToWords(int number, String lang) {
    if (number < 0 || number > 1000000000) {
      log('Out of range ${number.toString()} [0: 1000000000]');
      return number.toString();
      // return lang == 'ar' ? 'خارج النطاق' : 'Out of range';
    }
    return lang == 'ar' ? _numberToArabic(number) : _numberToEnglish(number);
  }

  String _numberToEnglish(int number) {
    final units = [
      'zero',
      'one',
      'two',
      'three',
      'four',
      'five',
      'six',
      'seven',
      'eight',
      'nine',
    ];
    final teens = [
      'ten',
      'eleven',
      'twelve',
      'thirteen',
      'fourteen',
      'fifteen',
      'sixteen',
      'seventeen',
      'eighteen',
      'nineteen',
    ];
    final tens = [
      '',
      '',
      'twenty',
      'thirty',
      'forty',
      'fifty',
      'sixty',
      'seventy',
      'eighty',
      'ninety',
    ];

    if (number == 0) return 'zero';
    if (number == 1000000000) return 'one billion';

    String convertChunk(int n) {
      if (n == 0) return '';
      if (n < 10) return units[n];
      if (n < 20) return teens[n - 10];
      if (n < 100) {
        int t = n ~/ 10;
        int u = n % 10;
        return '${tens[t]}${u > 0 ? '-${units[u]}' : ''}';
      }
      int h = n ~/ 100;
      int rem = n % 100;
      return '${units[h]} hundred${rem > 0 ? ' and ${convertChunk(rem)}' : ''}';
    }

    String result = '';
    int billion = number ~/ 1000000000;
    number %= 1000000000;
    int million = number ~/ 1000000;
    number %= 1000000;
    int thousand = number ~/ 1000;
    number %= 1000;

    if (billion > 0) result += '${convertChunk(billion)} billion';
    if (million > 0) {
      result +=
          '${result.isNotEmpty ? ' ' : ''}${convertChunk(million)} million';
    }
    if (thousand > 0) {
      result +=
          '${result.isNotEmpty ? ' ' : ''}${convertChunk(thousand)} thousand';
    }
    if (number > 0) {
      result += '${result.isNotEmpty ? ' ' : ''}${convertChunk(number)}';
    }

    return result;
  }

  String _numberToArabic(int number) {
    final units = [
      'صفر',
      'واحد',
      'اثنان',
      'ثلاثة',
      'أربعة',
      'خمسة',
      'ستة',
      'سبعة',
      'ثمانية',
      'تسعة',
    ];
    final teens = [
      'عشرة',
      'أحد عشر',
      'اثنا عشر',
      'ثلاثة عشر',
      'أربعة عشر',
      'خمسة عشر',
      'ستة عشر',
      'سبعة عشر',
      'ثمانية عشر',
      'تسعة عشر',
    ];
    final tens = [
      '',
      '',
      'عشرون',
      'ثلاثون',
      'أربعون',
      'خمسون',
      'ستون',
      'سبعون',
      'ثمانون',
      'تسعون',
    ];
    final hundreds = [
      '',
      'مائة',
      'مائتان',
      'ثلاثمائة',
      'أربعمائة',
      'خمسمائة',
      'ستمائة',
      'سبعمائة',
      'ثمانمائة',
      'تسعمائة',
    ];

    if (number == 0) return 'صفر';
    if (number == 1000000000) return 'مليار';

    String convertChunk(int n) {
      if (n == 0) return '';
      if (n < 10) return units[n];
      if (n < 20) return teens[n - 10];
      if (n < 100) {
        int t = n ~/ 10;
        int u = n % 10;
        return u == 0 ? tens[t] : '${units[u]} و${tens[t]}';
      }
      int h = n ~/ 100;
      int rem = n % 100;
      return '${hundreds[h]}${rem > 0 ? ' و${convertChunk(rem)}' : ''}';
    }

    String result = '';
    int billion = number ~/ 1000000000;
    number %= 1000000000;
    int million = number ~/ 1000000;
    number %= 1000000;
    int thousand = number ~/ 1000;
    number %= 1000;

    if (billion > 0) {
      result +=
          billion == 1
              ? "مليار"
              : billion == 2
              ? "ملياران"
              : "${convertChunk(billion)} مليارات";
    }
    if (million > 0) {
      if (result.isNotEmpty) result += ' و';
      if (million == 1) {
        result += 'مليون';
      } else if (million == 2) {
        result += 'مليونان';
      } else if (million >= 3 && million <= 10) {
        result += '${convertChunk(million)} ملايين';
      } else {
        result += '${convertChunk(million)} مليون';
      }
    }
    if (thousand > 0) {
      if (result.isNotEmpty) result += ' و';
      if (thousand == 1) {
        result += 'ألف';
      } else if (thousand == 2) {
        result += 'ألفان';
      } else if (thousand >= 3 && thousand <= 10) {
        result += '${convertChunk(thousand)} آلاف';
      } else {
        result += '${convertChunk(thousand)} ألف';
      }
    }
    if (number > 0) {
      if (result.isNotEmpty) result += ' و';
      result += convertChunk(number);
    }

    return result;
  }
}
