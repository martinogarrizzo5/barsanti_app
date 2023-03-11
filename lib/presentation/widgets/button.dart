import 'package:auto_route/auto_route.dart';
import 'package:barsanti_app/presentation/theme/barsanti_icons.dart';
import 'package:barsanti_app/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class BarsantiButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;

  const BarsantiButton({
    super.key,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Ink(
        decoration: BoxDecoration(
          border: Border.all(
            color: BarsantiColors.border,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12.0),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              icon,
              size: 24.0,
              color: BarsantiColors.text,
            ),
          ),
        ),
      ),
    );
  }
}
