import 'package:barsanti_app/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

@immutable
class BarsantiStyles {
  const BarsantiStyles._();

  static const double scaffoldXPadding = 32;
  static const double scaffoldYPadding = 16;

  static const TextStyle title = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: BarsantiColors.text,
  );

  static const TextStyle body = TextStyle(
    fontSize: 14,
    color: BarsantiColors.text,
    height: 1.4,
  );

  static const TextStyle miniNewsTitle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: BarsantiColors.text,
  );

  static const TextStyle miniNewsDate = TextStyle(
    fontSize: 14,
    color: BarsantiColors.subTitleLight,
  );

  static const TextStyle miniNewsCategory = TextStyle(
    fontSize: 14,
    color: BarsantiColors.subTitleLight,
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
    color: BarsantiColors.subTitleDark,
  );

  static const TextStyle newsCategory = TextStyle(
    fontSize: 14,
    color: BarsantiColors.subTitleDark,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle newsDetailsTitle = TextStyle(
    fontSize: 21,
    fontWeight: FontWeight.w600,
    color: BarsantiColors.text,
    height: 1.3,
  );

  static const TextStyle newsDetailsCategory = TextStyle(
    fontSize: 14,
    color: BarsantiColors.subTitleLight,
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
}
