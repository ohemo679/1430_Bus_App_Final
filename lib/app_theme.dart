
import 'package:flutter/material.dart';

class AppTheme {
  static const primaryColor = Color(0xFF000000);
  static const secondaryColor = Color(0xFFFFB612);
  static const backgroundColor = Color(0xFFF5F5F5);
  static const surfaceColor = Colors.white;
  static const dividerColor = Color(0xFFE0E0E0);

  static ThemeData get theme => ThemeData(
    useMaterial3: true,
    primaryColor: primaryColor,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: MaterialColor(0xFF000000, {
        50: Color(0xFFE0E0E0),
        100: Color(0xFFB3B3B3),
        200: Color(0xFF808080),
        300: Color(0xFF4D4D4D),
        400: Color(0xFF262626),
        500: Color(0xFF000000),
        600: Color(0xFF000000),
        700: Color(0xFF000000),
        800: Color(0xFF000000),
        900: Color(0xFF000000),
      }),
      accentColor: secondaryColor,
    ),
    scaffoldBackgroundColor: backgroundColor,

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: secondaryColor,
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: primaryColor.withOpacity(0.2)),
        ),
      ),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: secondaryColor,
      elevation: 2,
      centerTitle: false,
    ),

    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: primaryColor,
        letterSpacing: -0.5,
      ),
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: primaryColor,
        letterSpacing: 0,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        letterSpacing: 0.15,
        color: primaryColor.withOpacity(0.87),
      ),
    ),

    cardTheme: CardTheme(
      color: surfaceColor,
      elevation: 4,
      shadowColor: primaryColor.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: dividerColor, width: 1),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    ),

    switchTheme: SwitchThemeData(
      trackColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return secondaryColor;
        }
        return Colors.grey[400];
      }),
      thumbColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return primaryColor;
        }
        return Colors.white;
      }),
    ),

    sliderTheme: SliderThemeData(
      activeTrackColor: secondaryColor,
      inactiveTrackColor: primaryColor.withOpacity(0.2),
      thumbColor: primaryColor,
      overlayColor: secondaryColor.withOpacity(0.2),
      trackHeight: 4,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: surfaceColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: dividerColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: dividerColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: secondaryColor, width: 2),
      ),
    ),

    dividerTheme: const DividerThemeData(
      color: dividerColor,
      thickness: 1,
      space: 24,
    ),

    listTileTheme: ListTileThemeData(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: dividerColor),
      ),
      tileColor: surfaceColor,
      selectedTileColor: secondaryColor.withOpacity(0.1),
    ),
  );
}
