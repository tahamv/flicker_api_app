import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum ThemeType { dark, light }

extension AppTheme on ThemeData {
  Color get white => brightness == Brightness.light ? const Color(0xFFFFFFFF) : const Color(0xFFFFFFFF);

  Color get black => brightness == Brightness.light ? const Color(0xFF23274D) : const Color(0xFF23274D);

  Color get background => brightness == Brightness.light ? const Color(0xFFF8F9FF) : const Color(0xFFF8F9FF);

  Color get error => brightness == Brightness.light ? const Color(0xFFF14B4B) : const Color(0xFFF14B4B);

  Color get success => brightness == Brightness.light ? const Color(0xFF6FCF97) : const Color(0xFF6FCF97);

  Color get info => brightness == Brightness.light ? const Color(0xFFF2C94C) : const Color(0xFFF2C94C);

  Color get primary => brightness == Brightness.light ? const Color(0xFF006FFD) : const Color(0xFF006FFD);

  Color get lightPrimary => brightness == Brightness.light ? const Color(0xFF1976D2) : const Color(0xFF1976D2);

  Color get secondary => brightness == Brightness.light ? const Color(0xFFEAF2FF) : const Color(0xFFEAF2FF);

  Color get blue20 => brightness == Brightness.light ? const Color(0xFFF8F9FF) : const Color(0xFFF8F9FF);

  Color get blue10 => brightness == Brightness.light ? const Color(0xFFE1ECFB) : const Color(0xFFE1ECFB);

  Color get gray1 => brightness == Brightness.light ? const Color(0xFF636464) : const Color(0xFF636464);

  Color get gray2 => brightness == Brightness.light ? const Color(0xFF929292) : const Color(0xFF929292);

  Color get gray3 => brightness == Brightness.light ? const Color(0xFFA3AEBB) : const Color(0xFFA3AEBB);

  Color get gray4 => brightness == Brightness.light ? const Color(0xFFD1D6DD) : const Color(0xFFD1D6DD);

  Color get gray5 => brightness == Brightness.light ? const Color(0xFFEDEFF1) : const Color(0xFFEDEFF1);

  Color get gray6 => brightness == Brightness.light ? const Color(0xFFF7F8F9) : const Color(0xFFF7F8F9);

  Color get infoSnackBarBackground =>
      brightness == Brightness.light ? const Color(0xFF006FFD) : const Color(0xFF006FFD);

  Color get warningSnackBarBackground =>
      brightness == Brightness.light ? const Color(0xFFF2C94C) : const Color(0xFFF2C94C);

  Color get successSnackBarBackground =>
      brightness == Brightness.light ? const Color(0xFF6FCF97) : const Color(0xFF6FCF97);

  Color get errorSnackBarBackground =>
      brightness == Brightness.light ? const Color(0xFFF14B4B) : const Color(0xFFF14B4B);

  Brightness get statusBarIconBrightness => brightness == Brightness.light ? Brightness.dark : Brightness.light;

  Brightness get statusBarIconBrightnessNot => brightness == Brightness.light ? Brightness.light : Brightness.dark;

  ThemeData theme(String? languageCode) {
    TimePickerThemeData timePickerTheme = TimePickerThemeData(
      backgroundColor: white,
      dayPeriodTextColor: black,
      hourMinuteColor:
          MaterialStateColor.resolveWith((states) => states.contains(MaterialState.selected) ? blue10 : gray5),
      hourMinuteTextColor:
          MaterialStateColor.resolveWith((states) => states.contains(MaterialState.selected) ? primaryColor : black),
      dialHandColor: primaryColor,
      dialBackgroundColor: gray5,
      hourMinuteTextStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      dayPeriodTextStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      helpTextStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: gray1),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        contentPadding: EdgeInsets.all(0),
      ),
      dialTextColor:
          MaterialStateColor.resolveWith((states) => states.contains(MaterialState.selected) ? white : black),
      entryModeIconColor: gray1,
    );
    String fontFamily = 'Inter';
    return brightness == Brightness.light
        ? copyWith(
            timePickerTheme: timePickerTheme,
            scaffoldBackgroundColor: background,
            splashColor: background,
            // primaryColor: Colors.grey.shade900,
            progressIndicatorTheme: progressIndicatorTheme.copyWith(
              color: primary,
            ),
            textTheme: languageCode == 'en'
                ? _getDefaultTextTheme(black, fontFamily)
                : _getDefaultPersianTextTheme(black, fontFamily),
            appBarTheme: AppBarTheme(
              elevation: 0,
              color: background,
              systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: background),
            ),
            floatingActionButtonTheme: floatingActionButtonTheme.copyWith(
              backgroundColor: lightPrimary,
            ),
            colorScheme: ColorScheme(
                brightness: brightness,
                primary: primary,
                onPrimary: primary,
                secondary: secondary,
                onSecondary: secondary,
                error: error,
                onError: error,
                background: background,
                onBackground: background,
                surface: primary,
                onSurface: primary),
            iconTheme: iconTheme.copyWith(color: primary),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            radioTheme: RadioThemeData(
              fillColor: MaterialStateColor.resolveWith((states) => primary),
            ),
            checkboxTheme: CheckboxThemeData(
              overlayColor: MaterialStateColor.resolveWith((states) => primary),
            ))
        : copyWith(
            timePickerTheme: timePickerTheme,
            scaffoldBackgroundColor: background,
            splashColor: background,
            // primaryColor: Colors.grey.shade900,
            progressIndicatorTheme: progressIndicatorTheme.copyWith(
              color: primary,
            ),
            textTheme: languageCode == 'en'
                ? _getDefaultTextTheme(black, fontFamily)
                : _getDefaultPersianTextTheme(black, fontFamily),
            appBarTheme: AppBarTheme(
              elevation: 0,
              color: background,
              systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: background),
            ),
            floatingActionButtonTheme: floatingActionButtonTheme.copyWith(
              backgroundColor: lightPrimary,
            ),
            colorScheme: ColorScheme(
                brightness: brightness,
                primary: primary,
                onPrimary: primary,
                secondary: secondary,
                onSecondary: secondary,
                error: error,
                onError: error,
                background: background,
                onBackground: background,
                surface: primary,
                onSurface: primary),

            iconTheme: iconTheme.copyWith(color: black),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          );
  }

  TextTheme _getDefaultTextTheme(Color color, String fontFamily) {
    return textTheme.copyWith(
      displayLarge: textTheme.displayLarge
          ?.copyWith(height: 1.2, fontSize: 57, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: color),
      displayMedium: textTheme.displayMedium
          ?.copyWith(height: 1.2, fontSize: 45, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: color),
      displaySmall: textTheme.displaySmall
          ?.copyWith(height: 1.2, fontSize: 36, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: color),
      headlineLarge: textTheme.headlineLarge
          ?.copyWith(height: 1.2, fontSize: 32, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: color),
      headlineMedium: textTheme.headlineMedium
          ?.copyWith(height: 1.2, fontSize: 28, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: color),
      headlineSmall: textTheme.headlineSmall
          ?.copyWith(height: 1.2, fontSize: 24, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: color),
      titleLarge: textTheme.titleLarge
          ?.copyWith(height: 1.2, fontSize: 22, fontWeight: FontWeight.w500, fontFamily: fontFamily, color: color),
      titleMedium: textTheme.titleMedium
          ?.copyWith(height: 1.2, fontSize: 16, fontWeight: FontWeight.w500, fontFamily: fontFamily, color: color),
      titleSmall: textTheme.titleSmall
          ?.copyWith(height: 1.2, fontSize: 14, fontWeight: FontWeight.w500, fontFamily: fontFamily, color: color),
      labelLarge: textTheme.labelLarge
          ?.copyWith(height: 1.2, fontSize: 14, fontWeight: FontWeight.w500, fontFamily: fontFamily, color: color),
      labelMedium: textTheme.labelMedium
          ?.copyWith(height: 1.2, fontSize: 12, fontWeight: FontWeight.w500, fontFamily: fontFamily, color: color),
      labelSmall: textTheme.labelSmall
          ?.copyWith(height: 1.2, fontSize: 11, fontWeight: FontWeight.w500, fontFamily: fontFamily, color: color),
      bodyLarge: textTheme.bodyLarge
          ?.copyWith(height: 1.2, fontSize: 11, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: color),
      bodyMedium: textTheme.bodyMedium
          ?.copyWith(height: 1.2, fontSize: 10, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: color),
      bodySmall: textTheme.bodySmall
          ?.copyWith(height: 1.2, fontSize: 9, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: color),
    );
  }

  TextTheme _getDefaultPersianTextTheme(Color color, String fontFamily) {
    return textTheme.copyWith(
      displayLarge: textTheme.displayLarge
          ?.copyWith(height: 1, fontSize: 57, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: color),
      displayMedium: textTheme.displayMedium
          ?.copyWith(height: 1, fontSize: 45, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: color),
      displaySmall: textTheme.displaySmall
          ?.copyWith(height: 1, fontSize: 36, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: color),
      headlineLarge: textTheme.headlineLarge
          ?.copyWith(height: 1, fontSize: 32, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: color),
      headlineMedium: textTheme.headlineMedium
          ?.copyWith(height: 1, fontSize: 28, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: color),
      headlineSmall: textTheme.headlineSmall
          ?.copyWith(height: 1, fontSize: 24, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: color),
      titleLarge: textTheme.titleLarge
          ?.copyWith(height: 1, fontSize: 22, fontWeight: FontWeight.w500, fontFamily: fontFamily, color: color),
      titleMedium: textTheme.titleMedium
          ?.copyWith(height: 1, fontSize: 16, fontWeight: FontWeight.w500, fontFamily: fontFamily, color: color),
      titleSmall: textTheme.titleSmall
          ?.copyWith(height: 1, fontSize: 14, fontWeight: FontWeight.w500, fontFamily: fontFamily, color: color),
      labelLarge: textTheme.labelLarge
          ?.copyWith(height: 1, fontSize: 14, fontWeight: FontWeight.w500, fontFamily: fontFamily, color: color),
      labelMedium: textTheme.labelMedium
          ?.copyWith(height: 1, fontSize: 12, fontWeight: FontWeight.w500, fontFamily: fontFamily, color: color),
      labelSmall: textTheme.labelSmall
          ?.copyWith(height: 1, fontSize: 11, fontWeight: FontWeight.w500, fontFamily: fontFamily, color: color),
      bodyLarge: textTheme.bodyLarge
          ?.copyWith(height: 1, fontSize: 16, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: color),
      bodyMedium: textTheme.bodyMedium
          ?.copyWith(height: 1, fontSize: 14, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: color),
      bodySmall: textTheme.bodySmall
          ?.copyWith(height: 1, fontSize: 12, fontWeight: FontWeight.w400, fontFamily: fontFamily, color: color),
    );
  }
}
