import 'package:barsanti_app/presentation/theme/colors.dart';
import 'package:barsanti_app/presentation/theme/styles.dart';
import 'package:flutter/material.dart';

@immutable
class BarsantiTheme {
  const BarsantiTheme._();

  static ThemeData get() {
    return ThemeData(
      primarySwatch: BarsantiColors.primary,
      colorScheme: const ColorScheme.light(
        primary: BarsantiColors.primary,
        primaryVariant: BarsantiColors.primaryDarker,
        secondary: BarsantiColors.primary,
        secondaryVariant: BarsantiColors.primaryDarker,
        surface: Colors.white,
        background: Colors.white,
        error: Colors.red,
      ),
      scaffoldBackgroundColor: Colors.white,
      fontFamily: "Poppins",
      textTheme: const TextTheme(
        bodyLarge: BarsantiStyles.body,
        bodyMedium: BarsantiStyles.body,
        bodySmall: BarsantiStyles.body,
      ),
    );
  }
}
