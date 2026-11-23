import 'package:flutter/material.dart';
import 'package:frudence/app/theme/app_colors.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
    useMaterial3: true,

    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.green,
      brightness: Brightness.light,
    ),

    scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
    textTheme: const TextTheme(
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        height: 1.4,
        color: Colors.black54,
      ),
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: false
    ),

    cardTheme: const CardThemeData(
      elevation: 0
    ),

    extensions: const [
      AppColors(
        income: Color(0xFF2E7D32),
        expense: Color(0xFFC62828)
      )
    ]
  );

  static ThemeData get dark => ThemeData(
    useMaterial3: true,

    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.green,
      brightness: Brightness.dark
    ),

    textTheme: const TextTheme(
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        height: 1.4,
        color: Colors.white70,
      ),
    ),

    extensions: const [
      AppColors(
        income: Color(0xFF81C784),
        expense: Color(0xFFEF5350)
      )
    ]
  );
}
