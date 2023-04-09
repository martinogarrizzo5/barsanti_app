import 'package:barsanti_app/presentation/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoNewsFound extends StatelessWidget {
  const NoNewsFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 32),
          SvgPicture.asset(
            'assets/images/no-result.svg',
            width: 270,
          ),
          const Text(
            'Nessuna news trovata',
            style: AppStyles.noNewsTitle,
          ),
        ],
      ),
    );
  }
}

class NoMoreNews extends StatelessWidget {
  const NoMoreNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          Text("Nessun'altra news trovata"),
        ],
      ),
    );
  }
}
