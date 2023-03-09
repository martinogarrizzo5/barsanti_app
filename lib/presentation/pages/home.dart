import 'package:barsanti_app/presentation/theme/colors.dart';
import 'package:barsanti_app/presentation/theme/scroll.dart';
import 'package:barsanti_app/presentation/theme/styles.dart';
import 'package:barsanti_app/presentation/widgets/placeholders.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget _buildPlaceholder() {
    return Shimmer.fromColors(
      baseColor: BarsantiColors.tile,
      highlightColor: BarsantiColors.shimmerColor,
      period: const Duration(milliseconds: 1200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Caricamento...", style: BarsantiStyles.title),
          SizedBox(height: 12),
          BigNewsPlaceholder(),
          SizedBox(height: 18),
          Align(
            alignment: Alignment.center,
            child: SmoothIndicator(
              offset: 2,
              count: 5,
              effect: Scroll.dotsIndicatorEffect(),
            ),
          ),
          SizedBox(height: 24),
          Text("Caricamento...", style: BarsantiStyles.title),
          SizedBox(height: 12),
          MiniNewsPlaceholder(),
          SizedBox(height: 24),
          MiniNewsPlaceholder(),
          SizedBox(height: 24),
          MiniNewsPlaceholder(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: BarsantiStyles.scaffoldYPadding,
              horizontal: BarsantiStyles.scaffoldXPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: 180,
                  ),
                ),
                const SizedBox(height: 16),
                _buildPlaceholder(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
