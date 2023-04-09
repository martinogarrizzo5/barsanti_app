import 'package:barsanti_app/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

@immutable
class AppStyles {
  const AppStyles._();

  static const double scaffoldXPadding = 32;
  static const double scaffoldYPadding = 16;

  static const TextStyle title = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.text,
  );

  static const TextStyle body = TextStyle(
    fontSize: 14,
    color: AppColors.text,
    height: 1.4,
  );

  static const TextStyle miniNewsTitle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.text,
  );

  static const TextStyle miniNewsDate = TextStyle(
    fontSize: 14,
    color: AppColors.subTitleLight,
  );

  static const TextStyle miniNewsCategory = TextStyle(
    fontSize: 14,
    color: AppColors.subTitleLight,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle newsTitle = TextStyle(
    fontSize: 18,
    height: 1.2,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static const TextStyle newsDate = TextStyle(
    fontSize: 14,
    color: AppColors.subTitleDark,
  );

  static const TextStyle newsCategory = TextStyle(
    fontSize: 14,
    color: AppColors.subTitleDark,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle newsDetailsTitle = TextStyle(
    fontSize: 21,
    fontWeight: FontWeight.w600,
    color: AppColors.text,
    height: 1.3,
  );

  static const TextStyle newsDetailsCategory = TextStyle(
    fontSize: 14,
    color: AppColors.subTitleLight,
    fontWeight: FontWeight.w500,
  );

  static final button = ButtonStyle(
    shape: MaterialStateProperty.all(
      const StadiumBorder(),
    ),
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
    ),
  );

  static const TextStyle categoryCardName = TextStyle(
    fontSize: 15,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle categoryTitle = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle noNewsTitle = TextStyle(
    fontSize: 19,
    color: AppColors.text,
    fontWeight: FontWeight.w600,
  );
}
