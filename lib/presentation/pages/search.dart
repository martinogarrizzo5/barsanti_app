import "dart:math";

import "package:auto_route/auto_route.dart";
import "package:barsanti_app/data/api/categories_repo.dart";
import "package:barsanti_app/data/models/category/category.dart";
import "package:barsanti_app/presentation/theme/barsanti_icons.dart";
import "package:barsanti_app/presentation/theme/colors.dart";
import "package:barsanti_app/presentation/theme/styles.dart";
import "package:barsanti_app/presentation/widgets/network_image.dart";
import "package:barsanti_app/routes/router.gr.dart";
import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart";
import "package:get_it/get_it.dart";

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late Future<List<Category>> _categoriesRequest;

  @override
  void initState() {
    super.initState();
    _categoriesRequest = GetIt.I.get<CategoriesRepository>().getCategories();
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
                  child: Text(
                    categories[index].name,
                    style: BarsantiStyles.categoryCardName,
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => {},
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
    } else {
      return 250 + Random().nextInt(21) * 1.0;
    }
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
            children: [
              const SizedBox(height: 32),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: TextField(
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
