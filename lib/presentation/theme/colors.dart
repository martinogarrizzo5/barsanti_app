import "package:flutter/material.dart";

@immutable
class BarsantiColors {
  const BarsantiColors._();

  static const MaterialColor primary = MaterialColor(
    0xFF07789B,
    <int, Color>{
      50: Color(0xFFE6F2F4),
      100: Color(0xFFCCE5E9),
      200: Color(0xFF99C9D2),
      300: Color(0xFF66ADC9),
      400: Color(0xFF3392C0),
      500: _primary,
      600: Color(0xFF066E8F),
      700: Color(0xFF056484),
      800: Color(0xFF045A78),
      900: Color(0xFF034F6D),
    },
  );

  static const Color tile = Color(0xFFD0DDE1);
  static const Color inactiveControl = Color(0xFF74A0AE);

  static const Color _primary = Color(0xFF07789B);
  static const Color primaryDarker = Color(0xFF0A4C5F);

  static const Color border = Color(0xFFB8C0C7);
  static const Color text = Color(0xFF001F28);
  static const Color subTitleLight = Color(0xFF5E6F74);
  static const Color subTitleDark = Color(0xFFCCCCCC);
  static const Color searchBar = Color(0xFFEEEEEE);
  static const Color placeholderText = Color(0xFF8C9399);
  static const Color shimmerColor = Color(0xFFE4E9EB);

  static const Color dotColor = Color(0xFF5E6F74);
  static const Color dotActiveColor = Colors.white;
}
