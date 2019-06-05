
import 'package:flutter/material.dart';

class DateTimeUtils {
  static Future<DateTime> selectDate(BuildContext context) async {
    var currentDT = new DateTime.now();
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: currentDT,
        firstDate: currentDT,
        lastDate: currentDT.add(new Duration(days: 30))
    );
    return picked;
  }

  static Future<TimeOfDay> selectTime(BuildContext context) async {
    TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: new TimeOfDay.fromDateTime(new DateTime.now()),
    );
    return picked;
  }
}