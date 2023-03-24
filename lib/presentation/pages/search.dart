import "package:barsanti_app/data/api/categories_repo.dart";
import "package:barsanti_app/data/models/category/category.dart";
import "package:barsanti_app/presentation/theme/barsanti_icons.dart";
import "package:barsanti_app/presentation/theme/colors.dart";
import "package:barsanti_app/presentation/theme/styles.dart";
import "package:barsanti_app/presentation/widgets/network_image.dart";
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
        return Container(
          height: index != 0 && index % 2 == 0 ? 200 : 300,
          child: BarsantiNetworkImage(
            imageUrl: categories[index].imageUrl,
            width: double.infinity,
            height: index + 1 % 2 == 0 ? 200 : 300,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: BarsantiStyles.scaffoldYPadding,
            horizontal: BarsantiStyles.scaffoldXPadding,
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
