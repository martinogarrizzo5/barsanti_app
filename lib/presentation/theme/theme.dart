import 'package:barsanti_app/presentation/theme/colors.dart';
import 'package:barsanti_app/presentation/theme/styles.dart';
import 'package:flutter/material.dart';

@immutable
class AppTheme {
  const AppTheme._();

  static ThemeData get() {
    return ThemeData(
      primarySwatch: AppColors.primary,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        primaryVariant: AppColors.primaryDarker,
        secondary: AppColors.primary,
        secondaryVariant: AppColors.primaryDarker,
        surface: Colors.white,
        background: Colors.white,
        error: Colors.red,
      ),
      scaffoldBackgroundColor: Colors.white,
      fontFamily: "Poppins",
      textTheme: const TextTheme(
        bodyLarge: AppStyles.body,
        bodyMedium: AppStyles.body,
        bodySmall: AppStyles.body,
      ),
    );
  }
}
