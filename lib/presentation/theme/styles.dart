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
}
