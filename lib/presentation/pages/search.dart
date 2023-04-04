import "dart:async";
import "dart:math";

import "package:auto_route/auto_route.dart";
import "package:barsanti_app/data/api/categories_repo.dart";
import "package:barsanti_app/data/models/category/category.dart";
import "package:barsanti_app/presentation/theme/barsanti_icons.dart";
import "package:barsanti_app/presentation/theme/colors.dart";
import "package:barsanti_app/presentation/theme/styles.dart";
import "package:barsanti_app/presentation/widgets/network_error_dialog.dart";
import "package:barsanti_app/presentation/widgets/network_image.dart";
import "package:barsanti_app/routes/router.gr.dart";
import "package:flutter/material.dart";
import "package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart";
import "package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart";
import "package:get_it/get_it.dart";
import "package:shimmer/shimmer.dart";

@RoutePage()
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
    return Shimmer.fromColors(
      baseColor: BarsantiColors.tile,
      highlightColor: BarsantiColors.shimmerColor,
      period: const Duration(milliseconds: 1200),
      child: MasonryGridView.count(
        itemCount: 8,
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        shrinkWrap: true,
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final height = _calculateCategoryItemHeight(index);
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(height: height, color: Colors.red),
          );
        },
      ),
    );
  }

  Widget _buildCategoriesList(List<Category> categories) {
    return MasonryGridView.count(
      itemCount: categories.length,
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      shrinkWrap: true,
      primary: false,
      physics: const NeverScrollableScrollPhysics(),
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
                    style: BarsantiStyles.categoryCardName,
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => {
                      context.router.navigate(
                        CategoryRoute(
                          categoryId: categories[index].id,
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
    );
  }

  double _calculateCategoryItemHeight(int index) {
    if (index % 2 == 0) {
      return 200 + Random().nextInt(21) * 1.0;
    }

    return 250 + Random().nextInt(21) * 1.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: BarsantiStyles.scaffoldYPadding,
            horizontal: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: TextField(
                  focusNode: _searchFocusNode,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: BarsantiColors.searchBar,
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 16,
                    ),
                    hintText: "Cerca qualcosa...",
                    hintStyle: const TextStyle(
                      color: BarsantiColors.placeholderText,
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Icon(
                        BarsantiIcons.search,
                        size: 32,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.search,
                ),
              ),
              const SizedBox(height: 32),
              FutureBuilder(
                future: _categoriesRequest,
                builder: (ctx, snap) {
                  if (snap.hasError) {
                    debugPrint(snap.error.toString());
                    return Text("something went wrong");
                  }
                  if (snap.connectionState == ConnectionState.done) {
                    return _buildCategoriesList(snap.data!);
                  }

                  return Text("Loading...");
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
