import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

//Use ex
//  MyDateFormater.dateFormatedMMMMyOnlyMonthArabicFromString(
//                 "2024-10-30",
//                 showDayName: true,
//                 format: "yyyy-MM-dd",
//               )
class MyDateFormater {
  static String dateStringFromDateTime(DateTime date,
      {String format = "yyyy-MM-dd"}) {
    return DateFormat(format, "en").format(date);
  }

  static String dateFormatedMMMMy(DateTime date, {bool isEnglish = false}) {
    String formattedDate = !isEnglish
        ? DateFormat('d MMMM y', 'ar').format(date)
        : DateFormat('d MMMM y', 'en').format(date);

    return formattedDate;
  }

  static String formatDateMonthText(
    DateTime date, {
    bool isEnglish = false,
    bool showDayName = false,
    bool showDayNum = true,
  }) {
    if (isEnglish) {
      final format = showDayName
          ? DateFormat("EEE d MMMM yyyy", 'en')
          : DateFormat("d MMMM yyyy", 'en');
      return format.format(date);
    }

    // Arabic format
    final dayName =
        showDayName ? "${DateFormat('E', 'ar').format(date)}, " : "";
    final dayNum = showDayNum ? DateFormat('d', 'en').format(date) : "";
    final month = DateFormat('MMMM', 'ar').format(date);
    final year = DateFormat('yyyy', 'en').format(date);

    return "$dayName$dayNum $month $year".trim();
  }

  static String formatDateMonthTextFromString(String? date,
      {bool isEnglish = false,
      String? format = "MM/dd/yyyy",
      bool showDayName = false,
      bool showDayNum = true}) {
    if (date == null) return "";
    DateTime? dateFormated = convertStringToDateTime(date, format: format);
    if (dateFormated == null) return date;
    return formatDateMonthText(dateFormated,
        isEnglish: isEnglish, showDayName: showDayName, showDayNum: showDayNum);
  }

  static String dateFormatedMMMMyFomStringServerTimeContainT(String date,
      {bool isEnglish = false}) {
    DateTime? dateFormated =
        convertStringDateToDateTimeFormalDateContainT(date);
    if (dateFormated == null) return date;
    return dateFormatedMMMMy(dateFormated, isEnglish: isEnglish);
  }

  static DateTime? convertStringToDateTime(String date,
      {String? format = "MM/dd/yyyy"}) {
    try {
      // Parse the string date to DateTime
      DateTime parsedDate =
          DateFormat(format ?? "MM/dd/yyyy", "en").parse(date);
      return parsedDate;
    } catch (e) {
      // Handle invalid date format or other parsing issues
      debugPrint('Error parsing date: $e');
      return null; // Return a default DateTime if parsing fails
    }
  }

  static DateTime? convertStringDateToDateTimeFormalDateContainT(String date) {
    //check if string date is dateTime formate
    DateTime? dateTime;

    try {
      if (date.contains('T')) {
        dateTime = DateTime.parse(date);
      } else {
        dateTime = DateTime.parse('${date}T00:00:00');
      }
    } catch (_) {
      // dateTime = DateTime.now();
      dateTime = null;
    }

    return dateTime;
  }

  static bool date1isBeforeDate2(
      {required DateTime date1, required DateTime date2InBefore}) {
    DateTime strippedTimeSafe = DateTime(
      date1.year,
      date1.month,
      date1.day,
      // date1.hour,
      // date1.minute,
    );

    DateTime strippedTimeNow = DateTime(
      date2InBefore.year,
      date2InBefore.month,
      date2InBefore.day,
      // date2InBefore.hour,
      // date2InBefore.minute,
    );
    bool isBefore = strippedTimeSafe.isBefore(strippedTimeNow);

    return isBefore;
  }

  static String timeFormatedFromDate(DateTime date, {String local = "en"}) {
    String formattedTime = DateFormat('hh:mm a', local).format(date);
    return formattedTime;
  }

  static String timeFormatedFromTimeOfDay(
    TimeOfDay timeOfDay, {
    String local = "en",
  }) {
    DateTime date = convertTimeOfDayToDateTime(timeOfDay);
    return timeFormatedFromDate(date, local: local);
  }

  static String serverTZShape(DateTime date, {bool convertUTC = false}) {
    if (convertUTC) {
      date = date.toUtc();
    }
    String isoString = date.toIso8601String();
    if (!isoString.contains("Z")) {
      isoString = "${isoString}Z";
    }
    return isoString;
  }
}

DateTime convertTimeOfDayToDateTime(TimeOfDay timeOfDay) {
  DateTime date = DateTime.now();

  return DateTime(
    date.year,
    date.month,
    date.day,
    timeOfDay.hour,
    timeOfDay.minute,
  );
}
