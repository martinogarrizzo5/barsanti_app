import 'package:auto_route/auto_route.dart';
import 'package:barsanti_app/presentation/theme/barsanti_icons.dart';
import 'package:barsanti_app/presentation/theme/colors.dart';
import 'package:barsanti_app/presentation/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/images/empty-box.svg",
            height: 150,
            colorFilter: const ColorFilter.mode(
              BarsantiColors.primary,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            "Nessun Elemento Salvato",
            style: BarsantiStyles.title,
          ),
          const SizedBox(height: 8),
          ElevatedButton.icon(
            onPressed: () => context.tabsRouter.setActiveIndex(1),
            icon: const Icon(BarsantiIcons.search),
            label: const Text("Esplora News"),
            style: BarsantiStyles.button,
          )
        ],
      ),
    ));
  }
}
