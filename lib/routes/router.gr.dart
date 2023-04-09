// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:barsanti_app/data/models/category/category.dart' as _i12;
import 'package:barsanti_app/presentation/pages/category.dart' as _i1;
import 'package:barsanti_app/presentation/pages/home.dart' as _i2;
import 'package:barsanti_app/presentation/pages/layout.dart' as _i3;
import 'package:barsanti_app/presentation/pages/news_details.dart' as _i4;
import 'package:barsanti_app/presentation/pages/profile.dart' as _i6;
import 'package:barsanti_app/presentation/pages/search.dart' as _i7;
import 'package:barsanti_app/presentation/pages/search_intro.dart' as _i8;
import 'package:barsanti_app/presentation/widgets/empty_routers.dart' as _i9;
import 'package:flutter/material.dart' as _i11;

abstract class $AppRouter extends _i10.RootStackRouter {
  $AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    CategoryRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.CategoryScreen(
          key: args.key,
          category: args.category,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    MainRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.MainScreen(),
      );
    },
    NewsDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<NewsDetailsRouteArgs>(
          orElse: () =>
              NewsDetailsRouteArgs(newsId: pathParams.getInt('newsId')));
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.NewsDetailsScreen(
          key: args.key,
          newsId: args.newsId,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ProfileScreen(),
      );
    },
    SearchRoute.name: (routeData) {
      final args = routeData.argsAs<SearchRouteArgs>(
          orElse: () => const SearchRouteArgs());
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.SearchScreen(
          key: args.key,
          searchedText: args.searchedText,
        ),
      );
    },
    SearchIntroRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SearchIntroScreen(),
      );
    },
    HomeRouter.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.HomeRouterPage(),
      );
    },
    SearchRouter.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.SearchRouterPage(),
      );
    },
    ProfileRouter.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.ProfileRouterPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.CategoryScreen]
class CategoryRoute extends _i10.PageRouteInfo<CategoryRouteArgs> {
  CategoryRoute({
    _i11.Key? key,
    required _i12.Category category,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          CategoryRoute.name,
          args: CategoryRouteArgs(
            key: key,
            category: category,
          ),
          initialChildren: children,
        );

  static const String name = 'CategoryRoute';

  static const _i10.PageInfo<CategoryRouteArgs> page =
      _i10.PageInfo<CategoryRouteArgs>(name);
}

class CategoryRouteArgs {
  const CategoryRouteArgs({
    this.key,
    required this.category,
  });

  final _i11.Key? key;

  final _i12.Category category;

  @override
  String toString() {
    return 'CategoryRouteArgs{key: $key, category: $category}';
  }
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute({List<_i10.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i3.MainScreen]
class MainRoute extends _i10.PageRouteInfo<void> {
  const MainRoute({List<_i10.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i4.NewsDetailsScreen]
class NewsDetailsRoute extends _i10.PageRouteInfo<NewsDetailsRouteArgs> {
  NewsDetailsRoute({
    _i11.Key? key,
    required int newsId,
    List<_i10.PageRouteInfo>? children,
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

  static const _i10.PageInfo<NewsDetailsRouteArgs> page =
      _i10.PageInfo<NewsDetailsRouteArgs>(name);
}

class NewsDetailsRouteArgs {
  const NewsDetailsRouteArgs({
    this.key,
    required this.newsId,
  });

  final _i11.Key? key;

  final int newsId;

  @override
  String toString() {
    return 'NewsDetailsRouteArgs{key: $key, newsId: $newsId}';
  }
}

/// generated route for
/// [_i5.PdfViewScreen]
class PdfViewRoute extends _i10.PageRouteInfo<PdfViewRouteArgs> {
  PdfViewRoute({
    _i11.Key? key,
    required String url,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          PdfViewRoute.name,
          args: PdfViewRouteArgs(
            key: key,
            url: url,
          ),
          initialChildren: children,
        );

  static const String name = 'PdfViewRoute';

  static const _i10.PageInfo<PdfViewRouteArgs> page =
      _i10.PageInfo<PdfViewRouteArgs>(name);
}

class PdfViewRouteArgs {
  const PdfViewRouteArgs({
    this.key,
    required this.url,
  });

  final _i11.Key? key;

  final String url;

  @override
  String toString() {
    return 'PdfViewRouteArgs{key: $key, url: $url}';
  }
}

/// generated route for
/// [_i6.ProfileScreen]
class ProfileRoute extends _i10.PageRouteInfo<void> {
  const ProfileRoute({List<_i10.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SearchScreen]
class SearchRoute extends _i10.PageRouteInfo<SearchRouteArgs> {
  SearchRoute({
    _i11.Key? key,
    String? searchedText,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          SearchRoute.name,
          args: SearchRouteArgs(
            key: key,
            searchedText: searchedText,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const _i10.PageInfo<SearchRouteArgs> page =
      _i10.PageInfo<SearchRouteArgs>(name);
}

class SearchRouteArgs {
  const SearchRouteArgs({
    this.key,
    this.searchedText,
  });

  final _i11.Key? key;

  final String? searchedText;

  @override
  String toString() {
    return 'SearchRouteArgs{key: $key, searchedText: $searchedText}';
  }
}

/// generated route for
/// [_i8.SearchIntroScreen]
class SearchIntroRoute extends _i10.PageRouteInfo<void> {
  const SearchIntroRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SearchIntroRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchIntroRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i9.HomeRouterPage]
class HomeRouter extends _i10.PageRouteInfo<void> {
  const HomeRouter({List<_i10.PageRouteInfo>? children})
      : super(
          HomeRouter.name,
          initialChildren: children,
        );

  static const String name = 'HomeRouter';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SearchRouterPage]
class SearchRouter extends _i10.PageRouteInfo<void> {
  const SearchRouter({List<_i10.PageRouteInfo>? children})
      : super(
          SearchRouter.name,
          initialChildren: children,
        );

  static const String name = 'SearchRouter';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i9.ProfileRouterPage]
class ProfileRouter extends _i10.PageRouteInfo<void> {
  const ProfileRouter({List<_i10.PageRouteInfo>? children})
      : super(
          ProfileRouter.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRouter';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}
