import "dart:async";
import "dart:math";

import "package:auto_route/auto_route.dart";
import "package:barsanti_app/data/api/categories_repo.dart";
import "package:barsanti_app/data/models/category/category.dart";
import "package:barsanti_app/presentation/theme/colors.dart";
import "package:barsanti_app/presentation/theme/styles.dart";
import "package:barsanti_app/presentation/widgets/network_error.dart";
import "package:barsanti_app/presentation/widgets/network_image.dart";
import "package:barsanti_app/presentation/widgets/search_bar.dart";
import "package:barsanti_app/routes/router.gr.dart";
import "package:flutter/material.dart";
import "package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart";
import "package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart";
import "package:get_it/get_it.dart";
import "package:shimmer/shimmer.dart";

@RoutePage()
class SearchIntroScreen extends StatefulWidget {
  const SearchIntroScreen({super.key});

  @override
  State<SearchIntroScreen> createState() => _SearchIntroScreenState();
}

class _SearchIntroScreenState extends State<SearchIntroScreen> {
  TextEditingController _searchController = TextEditingController();
  late Future<List<Category>> _categoriesRequest;

  final FocusNode _searchFocusNode = FocusNode();
  late StreamSubscription<bool> keyboardSubscription;

  @override
  void initState() {
    super.initState();
    _categoriesRequest = GetIt.I.get<CategoriesRepository>().getCategories();

    var keyboardVisibilityController = KeyboardVisibilityController();

    // ensure text field is unfocused when keyboard is hidden to prevent keyboard from popping up again
    // when navigating back in another screen
    keyboardSubscription = keyboardVisibilityController.onChange.listen(
      (bool visible) {
        if (!visible) {
          _searchFocusNode.unfocus();
        }
      },
    );
  }

  Future<void> _refreshCategories() async {
    setState(() {
      _categoriesRequest = GetIt.I.get<CategoriesRepository>().getCategories();
    });
  }

  Widget _buildCategoriesPlaceholder() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        vertical: AppStyles.scaffoldYPadding,
        horizontal: 24,
      ),
      sliver: SliverMasonryGrid.count(
        childCount: 8,
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        itemBuilder: (context, index) {
          final height = _calculateCategoryItemHeight(index);
          return Shimmer.fromColors(
            baseColor: AppColors.tile,
            highlightColor: AppColors.shimmerColor,
            period: const Duration(milliseconds: 1200),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                height: height,
                color: Colors.grey[200],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCategoriesList(List<Category> categories) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 24,
      ),
      sliver: SliverMasonryGrid.count(
        childCount: categories.length,
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        itemBuilder: (context, index) {
          final height = _calculateCategoryItemHeight(index);
          return SizedBox(
            height: height,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                children: [
                  BarsantiNetworkImage(
                    imageUrl: categories[index].imageUrl,
                    width: double.infinity,
                    height: height,
                  ),
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.05),
                          Colors.black.withOpacity(0.6),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    left: 16,
                    right: 16,
                    child: Text(
                      categories[index].name,
                      style: AppStyles.categoryCardName,
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => {
                        context.router.navigate(
                          CategoryRoute(
                            category: categories[index],
                          ),
                        )
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  double _calculateCategoryItemHeight(int index) {
    if (index % 2 == 0) {
      return 200 + Random().nextInt(21) * 1.0;
    }

    return 250 + Random().nextInt(21) * 1.0;
  }

  void _goToSearchPage(String text) {
    context.router.navigate(
      SearchRoute(
        searchedText: text,
      ),
    );
    _searchController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refreshCategories,
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 20,
              backgroundColor: Colors.white,
            ),
            SliverAppBar(
              toolbarHeight: 0,
              automaticallyImplyLeading: false,
              floating: true,
              pinned: true,
              snap: true,
              backgroundColor: Colors.white,
              bottom: AppBar(
                backgroundColor: Colors.white,
                toolbarHeight: 75,
                automaticallyImplyLeading: false,
                elevation: 0,
                title: BarsantiSearchBar(
                  onSearch: _goToSearchPage,
                  searchFocusNode: _searchFocusNode,
                  controller: _searchController,
                ),
              ),
            ),
            FutureBuilder(
              future: _categoriesRequest,
              builder: (ctx, snap) {
                switch (snap.connectionState) {
                  case ConnectionState.waiting:
                    return _buildCategoriesPlaceholder();
                  case ConnectionState.done:
                  default:
                    if (snap.hasError) {
                      debugPrint(snap.error.toString());
                      return NetworkError(
                        padding: const EdgeInsets.only(top: 48.0),
                        onRetry: () => _refreshCategories(),
                      );
                    }
                    return _buildCategoriesList(snap.data!);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

/*

SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppStyles.scaffoldYPadding,
              horizontal: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                SearchBar(
                  onSearch: _goToSearchPage,
                  searchFocusNode: _searchFocusNode,
                  controller: _searchController,
                ),
                const SizedBox(height: 32),
                FutureBuilder(
                  future: _categoriesRequest,
                  builder: (ctx, snap) {
                    switch (snap.connectionState) {
                      case ConnectionState.waiting:
                        return _buildCategoriesPlaceholder();
                      case ConnectionState.done:
                      default:
                        if (snap.hasError) {
                          debugPrint(snap.error.toString());
                          return NetworkError(
                            padding: const EdgeInsets.only(top: 48.0),
                            onRetry: () => _refreshCategories(),
                          );
                        }
                        return _buildCategoriesList(snap.data!);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
*/