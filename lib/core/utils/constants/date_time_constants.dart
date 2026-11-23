const monthsMap = {
  1: 'January',
  2: 'FeBruary',
  3: 'March',
  4: 'April',
  5: 'May',
  6: 'June',
  7: 'July',
  8: 'August',
  9: 'September',
  10: 'October',
  11: 'November',
  12: 'December'
};

const weekDays = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday'
];

class DateFormatElement {
  DateFormatElement._();

  static const String yyyy = 'yyyy_dateFormat';
  static const String mm = 'mm_dateFormat';
  static const String dd = 'dd_dateFormat';
  static const String weekday = 'weekday_dateFormat';
  static const String month = 'month_dateFormat';
}

class TimeFormatElement {
  TimeFormatElement._();

  static const String hh24 = 'hh24_timeFormat';
  static const String hh12 = 'hh12_timeFormat';
  static const String mm = 'mm_timeFormat';
  static const String ss = 'ss_timeFormat';
}

class DateTimeFormatSeparator {
  DateTimeFormatSeparator._();

  static const String comma = ',';
  static const String slash = '/';
  static const String hyphen = '-';
  static const String colon = ':';
  static const String space = ' ';
}