// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:auto_route/empty_router_widgets.dart' as _i2;
import 'package:flutter/material.dart' as _i8;

import '../presentation/pages/home.dart' as _i3;
import '../presentation/pages/layout.dart' as _i1;
import '../presentation/pages/news_details.dart' as _i4;
import '../presentation/pages/profile.dart' as _i6;
import '../presentation/pages/search.dart' as _i5;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    MainScreenRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MainScreen(),
      );
    },
    HomeRouter.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    SearchRouter.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    ProfileRouter.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.HomeScreen(),
      );
    },
    NewsDetailsScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<NewsDetailsScreenRouteArgs>(
          orElse: () =>
              NewsDetailsScreenRouteArgs(newsId: pathParams.getInt('newsId')));
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.NewsDetailsScreen(
          key: args.key,
          newsId: args.newsId,
        ),
      );
    },
    SearchScreenRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.SearchScreen(),
      );
    },
    ProfileScreenRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.ProfileScreen(),
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/main',
          fullMatch: true,
        ),
        _i7.RouteConfig(
          MainScreenRoute.name,
          path: '/main',
          children: [
            _i7.RouteConfig(
              '#redirect',
              path: '',
              parent: MainScreenRoute.name,
              redirectTo: 'home',
              fullMatch: true,
            ),
            _i7.RouteConfig(
              HomeRouter.name,
              path: 'home',
              parent: MainScreenRoute.name,
              children: [
                _i7.RouteConfig(
                  HomeScreenRoute.name,
                  path: '',
                  parent: HomeRouter.name,
                ),
                _i7.RouteConfig(
                  NewsDetailsScreenRoute.name,
                  path: 'news/:newsId',
                  parent: HomeRouter.name,
                ),
              ],
            ),
            _i7.RouteConfig(
              SearchRouter.name,
              path: 'search',
              parent: MainScreenRoute.name,
              children: [
                _i7.RouteConfig(
                  SearchScreenRoute.name,
                  path: '',
                  parent: SearchRouter.name,
                )
              ],
            ),
            _i7.RouteConfig(
              ProfileRouter.name,
              path: 'profile',
              parent: MainScreenRoute.name,
              children: [
                _i7.RouteConfig(
                  ProfileScreenRoute.name,
                  path: '',
                  parent: ProfileRouter.name,
                )
              ],
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.MainScreen]
class MainScreenRoute extends _i7.PageRouteInfo<void> {
  const MainScreenRoute({List<_i7.PageRouteInfo>? children})
      : super(
          MainScreenRoute.name,
          path: '/main',
          initialChildren: children,
        );

  static const String name = 'MainScreenRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class HomeRouter extends _i7.PageRouteInfo<void> {
  const HomeRouter({List<_i7.PageRouteInfo>? children})
      : super(
          HomeRouter.name,
          path: 'home',
          initialChildren: children,
        );

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class SearchRouter extends _i7.PageRouteInfo<void> {
  const SearchRouter({List<_i7.PageRouteInfo>? children})
      : super(
          SearchRouter.name,
          path: 'search',
          initialChildren: children,
        );

  static const String name = 'SearchRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class ProfileRouter extends _i7.PageRouteInfo<void> {
  const ProfileRouter({List<_i7.PageRouteInfo>? children})
      : super(
          ProfileRouter.name,
          path: 'profile',
          initialChildren: children,
        );

  static const String name = 'ProfileRouter';
}

/// generated route for
/// [_i3.HomeScreen]
class HomeScreenRoute extends _i7.PageRouteInfo<void> {
  const HomeScreenRoute()
      : super(
          HomeScreenRoute.name,
          path: '',
        );

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i4.NewsDetailsScreen]
class NewsDetailsScreenRoute
    extends _i7.PageRouteInfo<NewsDetailsScreenRouteArgs> {
  NewsDetailsScreenRoute({
    _i8.Key? key,
    required int newsId,
  }) : super(
          NewsDetailsScreenRoute.name,
          path: 'news/:newsId',
          args: NewsDetailsScreenRouteArgs(
            key: key,
            newsId: newsId,
          ),
          rawPathParams: {'newsId': newsId},
        );

  static const String name = 'NewsDetailsScreenRoute';
}

class NewsDetailsScreenRouteArgs {
  const NewsDetailsScreenRouteArgs({
    this.key,
    required this.newsId,
  });

  final _i8.Key? key;

  final int newsId;

  @override
  String toString() {
    return 'NewsDetailsScreenRouteArgs{key: $key, newsId: $newsId}';
  }
}

/// generated route for
/// [_i5.SearchScreen]
class SearchScreenRoute extends _i7.PageRouteInfo<void> {
  const SearchScreenRoute()
      : super(
          SearchScreenRoute.name,
          path: '',
        );

  static const String name = 'SearchScreenRoute';
}

/// generated route for
/// [_i6.ProfileScreen]
class ProfileScreenRoute extends _i7.PageRouteInfo<void> {
  const ProfileScreenRoute()
      : super(
          ProfileScreenRoute.name,
          path: '',
        );

  static const String name = 'ProfileScreenRoute';
}
