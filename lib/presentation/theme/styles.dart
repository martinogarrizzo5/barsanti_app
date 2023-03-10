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
    color: BarsantiColors.title,
  );

  static const TextStyle miniNewsTitle = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w600,
    color: BarsantiColors.title,
    fontFamily: "NewsReader",
    height: 1.3,
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
}
