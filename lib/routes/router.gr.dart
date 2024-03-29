// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:barsanti_app/data/models/category/category.dart' as _i11;
import 'package:barsanti_app/presentation/pages/category.dart' as _i1;
import 'package:barsanti_app/presentation/pages/home.dart' as _i2;
import 'package:barsanti_app/presentation/pages/layout.dart' as _i3;
import 'package:barsanti_app/presentation/pages/news_details.dart' as _i4;
import 'package:barsanti_app/presentation/pages/profile.dart' as _i5;
import 'package:barsanti_app/presentation/pages/search.dart' as _i6;
import 'package:barsanti_app/presentation/pages/search_intro.dart' as _i7;
import 'package:barsanti_app/presentation/widgets/empty_routers.dart' as _i8;
import 'package:flutter/material.dart' as _i10;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    CategoryRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.CategoryScreen(
          key: args.key,
          category: args.category,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    MainRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.MainScreen(),
      );
    },
    NewsDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<NewsDetailsRouteArgs>(
          orElse: () =>
              NewsDetailsRouteArgs(newsId: pathParams.getInt('newsId')));
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.NewsDetailsScreen(
          key: args.key,
          newsId: args.newsId,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ProfileScreen(),
      );
    },
    SearchRoute.name: (routeData) {
      final args = routeData.argsAs<SearchRouteArgs>(
          orElse: () => const SearchRouteArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.SearchScreen(
          key: args.key,
          searchedText: args.searchedText,
        ),
      );
    },
    SearchIntroRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SearchIntroScreen(),
      );
    },
    HomeRouter.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.HomeRouterPage(),
      );
    },
    SearchRouter.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.SearchRouterPage(),
      );
    },
    ProfileRouter.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.ProfileRouterPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.CategoryScreen]
class CategoryRoute extends _i9.PageRouteInfo<CategoryRouteArgs> {
  CategoryRoute({
    _i10.Key? key,
    required _i11.Category category,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          CategoryRoute.name,
          args: CategoryRouteArgs(
            key: key,
            category: category,
          ),
          initialChildren: children,
        );

  static const String name = 'CategoryRoute';

  static const _i9.PageInfo<CategoryRouteArgs> page =
      _i9.PageInfo<CategoryRouteArgs>(name);
}

class CategoryRouteArgs {
  const CategoryRouteArgs({
    this.key,
    required this.category,
  });

  final _i10.Key? key;

  final _i11.Category category;

  @override
  String toString() {
    return 'CategoryRouteArgs{key: $key, category: $category}';
  }
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.MainScreen]
class MainRoute extends _i9.PageRouteInfo<void> {
  const MainRoute({List<_i9.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i4.NewsDetailsScreen]
class NewsDetailsRoute extends _i9.PageRouteInfo<NewsDetailsRouteArgs> {
  NewsDetailsRoute({
    _i10.Key? key,
    required int newsId,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          NewsDetailsRoute.name,
          args: NewsDetailsRouteArgs(
            key: key,
            newsId: newsId,
          ),
          rawPathParams: {'newsId': newsId},
          initialChildren: children,
        );

  static const String name = 'NewsDetailsRoute';

  static const _i9.PageInfo<NewsDetailsRouteArgs> page =
      _i9.PageInfo<NewsDetailsRouteArgs>(name);
}

class NewsDetailsRouteArgs {
  const NewsDetailsRouteArgs({
    this.key,
    required this.newsId,
  });

  final _i10.Key? key;

  final int newsId;

  @override
  String toString() {
    return 'NewsDetailsRouteArgs{key: $key, newsId: $newsId}';
  }
}

/// generated route for
/// [_i5.ProfileScreen]
class ProfileRoute extends _i9.PageRouteInfo<void> {
  const ProfileRoute({List<_i9.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SearchScreen]
class SearchRoute extends _i9.PageRouteInfo<SearchRouteArgs> {
  SearchRoute({
    _i10.Key? key,
    String? searchedText,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          SearchRoute.name,
          args: SearchRouteArgs(
            key: key,
            searchedText: searchedText,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const _i9.PageInfo<SearchRouteArgs> page =
      _i9.PageInfo<SearchRouteArgs>(name);
}

class SearchRouteArgs {
  const SearchRouteArgs({
    this.key,
    this.searchedText,
  });

  final _i10.Key? key;

  final String? searchedText;

  @override
  String toString() {
    return 'SearchRouteArgs{key: $key, searchedText: $searchedText}';
  }
}

/// generated route for
/// [_i7.SearchIntroScreen]
class SearchIntroRoute extends _i9.PageRouteInfo<void> {
  const SearchIntroRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SearchIntroRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchIntroRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.HomeRouterPage]
class HomeRouter extends _i9.PageRouteInfo<void> {
  const HomeRouter({List<_i9.PageRouteInfo>? children})
      : super(
          HomeRouter.name,
          initialChildren: children,
        );

  static const String name = 'HomeRouter';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SearchRouterPage]
class SearchRouter extends _i9.PageRouteInfo<void> {
  const SearchRouter({List<_i9.PageRouteInfo>? children})
      : super(
          SearchRouter.name,
          initialChildren: children,
        );

  static const String name = 'SearchRouter';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.ProfileRouterPage]
class ProfileRouter extends _i9.PageRouteInfo<void> {
  const ProfileRouter({List<_i9.PageRouteInfo>? children})
      : super(
          ProfileRouter.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRouter';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
