import "dart:io";
import "package:auto_route/auto_route.dart";
import 'package:barsanti_app/presentation/theme/barsanti_icons.dart';
import "package:barsanti_app/presentation/theme/colors.dart";
import "package:barsanti_app/routes/router.gr.dart";
import "package:flutter/material.dart";
import "package:google_nav_bar/google_nav_bar.dart";

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  final List<PageRouteInfo<dynamic>> routes = const [
    HomeRouter(),
    SearchRouter(),
    ProfileRouter(),
  ];

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      lazyLoad: false,
      homeIndex: 0,
      routes: routes,
      transitionBuilder: (ctx, child, animation) {
        return child;
      },
      builder: (ctx, child) {
        final tabsRouter = AutoTabsRouter.of(ctx);

        return Scaffold(
          body: child,
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: BarsantiColors.border)),
            ),
            child: GNav(
              selectedIndex: tabsRouter.activeIndex,
              onTabChange: (index) {
                if (tabsRouter.activeIndex == index) {
                  tabsRouter.navigate(routes[index]);
                } else {
                  tabsRouter.setActiveIndex(index);
                }
              },
              duration: const Duration(milliseconds: 300),
              gap: 8,
              backgroundColor: Colors.white,
              color: BarsantiColors.inactiveControl,
              activeColor: Colors.white,
              iconSize: 26,
              tabBackgroundColor: Theme.of(context).primaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              tabMargin: Platform.isIOS
                  ? const EdgeInsets.only(
                      bottom: 36, top: 16, left: 16, right: 16)
                  : const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              hoverColor: Theme.of(context).primaryColor.withOpacity(0.1),
              rippleColor: Theme.of(context).primaryColor.withOpacity(0.15),
              textStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              tabs: const [
                GButton(
                  icon: BarsantiIcons.home,
                  text: "Home",
                ),
                GButton(
                  icon: BarsantiIcons.search,
                  text: "Cerca",
                ),
                GButton(
                  icon: BarsantiIcons.bookmark,
                  text: "Preferiti",
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
