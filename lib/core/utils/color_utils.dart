import 'package:flutter/material.dart';

/// Converts a hexadecimal RGB string to a Flutter Color object.
/// Parameters:
/// - [hex]: A string representing a hexadecimal color value (e.g., '#FF5733').
/// Returns a Color object.
Color colorFromHex(String hex) {
  final value = hex.replaceFirst('#', '');
    
  return Color(
    int.parse('FF$value', radix: 16)
  );
}

/// Converts a Flutter Color object to a hexadecimal RGB string.
/// Parameters:
/// - [color]: A Color object to convert.
/// Returns a string representing the hexadecimal color value (e.g., '#FF5733').
String toHex(Color color) {
  return '#${color.toARGB32().toRadixString(16).substring(2).toUpperCase()}';
}
