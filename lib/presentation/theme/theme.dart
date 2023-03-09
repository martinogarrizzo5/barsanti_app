import 'package:barsanti_app/presentation/theme/colors.dart';
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
    );
  }
}
