import "package:auto_route/auto_route.dart";
import 'package:barsanti_app/routes/router.gr.dart';

// TODO: remember to always run "flutter packages pub run build_runner watch" to apply changes to the routers
@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      path: "/",
      page: MainRoute.page,
      children: [
        AutoRoute(
          path: "home",
          page: HomeRouter.page,
          children: [
            AutoRoute(
              path: "",
              page: HomeRoute.page,
            ),
            AutoRoute(
              path: "news/:newsId",
              page: NewsDetailsRoute.page,
            )
          ],
        ),
        AutoRoute(
          path: "search",
          page: SearchRouter.page,
          children: [
            AutoRoute(
              path: "",
              page: SearchIntroRoute.page,
            ),
            AutoRoute(
              path: "full",
              page: SearchRoute.page,
            ),
            AutoRoute(
              path: "category/:categoryId",
              page: CategoryRoute.page,
            ),
            AutoRoute(
              path: "news/:newsId",
              page: NewsDetailsRoute.page,
            )
          ],
        ),
        AutoRoute(
          path: "profile",
          page: ProfileRouter.page,
          children: [
            AutoRoute(
              path: "",
              page: ProfileRoute.page,
            ),
            AutoRoute(
              path: "news/:newsId",
              page: NewsDetailsRoute.page,
            )
          ],
        ),
      ],
    ),
    // AutoRoute(path: "/pdf-view", page: PdfViewRoute.page),
  ];
}
