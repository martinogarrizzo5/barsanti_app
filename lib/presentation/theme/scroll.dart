import "package:barsanti_app/presentation/theme/colors.dart";
import "package:flutter/material.dart";
import "package:smooth_page_indicator/smooth_page_indicator.dart";

class Scroll {
  static CustomizableEffect dotsIndicatorEffect() {
    return CustomizableEffect(
      dotDecoration: DotDecoration(
        width: 12,
        height: 12,
        borderRadius: BorderRadius.circular(999),
        color: BarsantiColors.dotColor,
      ),
      spacing: 10,
      activeDotDecoration: DotDecoration(
        width: 12,
        height: 12,
        borderRadius: BorderRadius.circular(999),
        color: Colors.white,
        dotBorder: const DotBorder(
          width: 2,
          color: BarsantiColors.text,
        ),
      ),
    );
  }
}
