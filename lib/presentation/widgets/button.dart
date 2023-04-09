import 'package:barsanti_app/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class BarsantiButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final bool isLoading;

  const BarsantiButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.isLoading = false,
  });

  Widget _buildLoadingIndicator() {
    return const SizedBox(
      height: 24.0,
      width: 24.0,
      child: CircularProgressIndicator(
        strokeWidth: 2.0,
      ),
    );
  }

  Widget _buildIcon() {
    return Icon(
      icon,
      size: 24.0,
      color: AppColors.primary,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: AppColors.border,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12.0),
          onTap: !isLoading ? onTap : null,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: isLoading ? _buildLoadingIndicator() : _buildIcon(),
          ),
        ),
      ),
    );
  }
}
