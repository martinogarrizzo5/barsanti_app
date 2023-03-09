import 'package:barsanti_app/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class BigNewsPlaceholder extends StatelessWidget {
  const BigNewsPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        color: BarsantiColors.tile,
        height: 250,
        width: MediaQuery.of(context).size.width * 0.9,
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
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            height: 100,
            width: 100,
            color: BarsantiColors.tile,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  height: 12,
                  width: 80,
                  color: BarsantiColors.tile,
                ),
              ),
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  height: 12,
                  color: BarsantiColors.tile,
                ),
              ),
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  height: 12,
                  color: BarsantiColors.tile,
                ),
              ),
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  height: 12,
                  width: 120,
                  color: BarsantiColors.tile,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
