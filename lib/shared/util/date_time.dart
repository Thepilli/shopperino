import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

int timeNow() {
  return DateTime.now().millisecondsSinceEpoch;
}

String formatStringDateTime(String dateString) {
  final dateTime = DateTime.parse(dateString);
  return DateFormat('hh:mm aaa').format(dateTime);
}

DateTime myStringToDateTime(String dateString) {
  return DateTime.parse(dateString);
}

DateTime stringToDateTime(String dateString) {
  try {
    DateFormat format = DateFormat.yMMMd();
    return format.parse(dateString);
  } catch (e) {
    return DateTime.now();
  }
}

String getTimeNow() {
  return DateFormat('hh:mm aaa').format(DateTime.now());
}

String getDateNow() {
  return DateFormat('MMM d, ' 'yyyy').format(DateTime.now());
}

String timeToString(TimeOfDay time) {
  try {
    final DateTime now = DateTime.now();
    final date = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return DateFormat.jm().format(date);
  } catch (e) {
    return '12:00 pm';
  }
}
