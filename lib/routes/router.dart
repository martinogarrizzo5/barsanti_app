import "package:auto_route/auto_route.dart";
import 'package:auto_route/empty_router_widgets.dart';
import 'package:barsanti_app/presentation/pages/home.dart';
import 'package:barsanti_app/presentation/pages/layout.dart';
import 'package:barsanti_app/presentation/pages/profile.dart';
import 'package:barsanti_app/presentation/pages/search.dart';
import "package:barsanti_app/presentation/pages/news_details.dart";

// TODO: remember to always run "flutter packages pub run build_runner watch" to apply changes to the routers
@MaterialAutoRouter(routes: [
  AutoRoute(
    path: "/main",
    page: MainScreen,
    initial: true,
    children: [
      AutoRoute(
          path: "home",
          page: EmptyRouterPage,
          name: "HomeRouter",
          initial: true,
          children: [
            AutoRoute(path: "", page: HomeScreen),
            AutoRoute(
              path: "news/:newsId",
              page: NewsDetailsScreen,
            )
          ]),
      AutoRoute(
          path: "search",
          page: EmptyRouterPage,
          name: "SearchRouter",
          children: [
            AutoRoute(path: "", page: SearchScreen),
          ]),
      AutoRoute(
          path: "profile",
          page: EmptyRouterPage,
          name: "ProfileRouter",
          children: [
            AutoRoute(path: "", page: ProfileScreen),
          ]),
    ],
  ),
])
class $AppRouter {}
