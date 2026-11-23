import 'package:frudence/core/utils/constants/date_time_constants.dart';

/// Convert number to currency
/// Parameters:
/// - [amount]: the numeric amount to format
/// Returns a US dollar currency string;
String currencyFormatter(num amount) {
  final parts = amount.toStringAsFixed(2).split('.');
  final intPart = parts[0];
  final decimalPart = parts[1];

  final intBuffer = <String>[];

  for (var i = 0; i < intPart.length; i++) {
    if (i > 0 && (intPart.length - i) % 3 == 0) {
      intBuffer.add(',');
    }
    intBuffer.add(intPart[i]);
  }

  return '\$${intBuffer.join()}.$decimalPart';
}

/// Format name with pattern Uppercase first letter followed by the rest
/// Parameters:
/// - [name]: A string to format
/// Returns Uppercase first letter followed by the rest formatted string
String nameFormatter(String name) {
  return name;
  // final words = name
  //     .split(RegExp(r'[^A-Za-z0-9]+'))
  //     .where((word) => word.isNotEmpty);
  // return words
  //     .map((word) =>
  //         '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}')
  //     .join(' ');
}

/// checks if the element is one of the separator
/// used in the dateTimeFormatter
/// Parameters:
/// - [element]: A string value to be checked
/// Returns true if it is a separator in Date time formatter, false otherwise
bool isDateTimeFormatSeparator(String element) {
  return [
    DateTimeFormatSeparator.colon,
    DateTimeFormatSeparator.comma,
    DateTimeFormatSeparator.hyphen,
    DateTimeFormatSeparator.slash,
    DateTimeFormatSeparator.space
  ].contains(element);
}

/// Format Flutter DateTime to readable date or time
/// Parameters:
/// - [dateTime]: A Datetime value to be formatted
/// - [format]: A list of strings determine the readable format
/// Returns a readable date or time format
String dateTimeFormatter(DateTime dateTime, List<String> format) {
  final formattedDateTime = StringBuffer();
  for (var i=0; i<format.length; i++) {
    final element = format[i];
    switch (element) {
      case DateFormatElement.yyyy:
        formattedDateTime.write(dateTime.year.toString());
      case DateFormatElement.mm:
        formattedDateTime.write(dateTime.month.toString().padLeft(2, '0'));
      case DateFormatElement.dd:
        formattedDateTime.write(dateTime.day.toString().padLeft(2, '0'));
      case DateFormatElement.weekday:
        formattedDateTime.write(weekDays[dateTime.weekday - 1]);
      case DateFormatElement.month:
        formattedDateTime.write(monthsMap[dateTime.month]);
      case TimeFormatElement.hh24:
        formattedDateTime.write(dateTime.hour.toString().padLeft(2, '0'));
      case TimeFormatElement.hh12:
        final hour = dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12;
        formattedDateTime.write(hour.toString().padLeft(2, '0'));
      case TimeFormatElement.mm:
        formattedDateTime.write(dateTime.minute.toString().padLeft(2, '0'));
      case TimeFormatElement.ss:
        formattedDateTime.write(dateTime.second.toString().padLeft(2, '0'));
      case DateTimeFormatSeparator.comma:
        formattedDateTime.write(', ');

      case DateTimeFormatSeparator.slash:
        formattedDateTime.write('/');

      case DateTimeFormatSeparator.hyphen:
        formattedDateTime.write('-');

      case DateTimeFormatSeparator.space:
        formattedDateTime.write(' ');
      default:
        throw ArgumentError('Unknown format element: $element');
    }
    if (i < format.length - 1 && !isDateTimeFormatSeparator(element)) {
      formattedDateTime.write(DateTimeFormatSeparator.space);

    }
  }
  return formattedDateTime.toString();
}