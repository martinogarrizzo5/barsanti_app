import 'package:barsanti_app/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class BigNewsPlaceholder extends StatelessWidget {
  const BigNewsPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return ImagePlaceholder(
      height: 250,
      width: MediaQuery.of(context).size.width * 0.9,
    );
  }
}

class TextPlaceholder extends StatelessWidget {
  final double width;

  const TextPlaceholder({super.key, this.width = 80});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 12,
        width: width,
        color: BarsantiColors.tile,
      ),
    );
  }
}

class ImagePlaceholder extends StatelessWidget {
  final double width;
  final double height;

  const ImagePlaceholder(
      {super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: height,
        width: width,
        color: BarsantiColors.tile,
      ),
    );
  }
}

class MiniNewsPlaceholder extends StatelessWidget {
  const MiniNewsPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ImagePlaceholder(
          height: 100,
          width: 100,
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              TextPlaceholder(),
              SizedBox(height: 12),
              TextPlaceholder(
                width: double.infinity,
              ),
              SizedBox(height: 12),
              TextPlaceholder(
                width: double.infinity,
              ),
              SizedBox(height: 12),
              TextPlaceholder(
                width: 120,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
