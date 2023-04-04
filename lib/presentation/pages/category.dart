import 'package:auto_route/auto_route.dart';
import 'package:barsanti_app/data/api/categories_repo.dart';
import 'package:barsanti_app/data/api/news_repo.dart';
import 'package:barsanti_app/data/models/category/category.dart';
import 'package:barsanti_app/data/models/news/news.dart';
import 'package:barsanti_app/presentation/theme/barsanti_icons.dart';
import 'package:barsanti_app/presentation/widgets/button.dart';
import 'package:barsanti_app/presentation/widgets/network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class CategoryScreen extends StatefulWidget {
  final Category? category;
  final int categoryId;

  const CategoryScreen(
      {super.key, required this.categoryId, required this.category});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late Future<List<News>> _newsRequest;
  Category? _category;

  @override
  void initState() {
    super.initState();
    _newsRequest =
        GetIt.I.get<NewsRepository>().getNews(category: widget.categoryId);

    if (widget.category == null) {
      GetIt.I
          .get<CategoriesRepository>()
          .getCategory(widget.categoryId)
          .then((value) {
        setState(() {
          _category = value;
        });
      });
    } else {
      _category = widget.category;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_category == null) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      body: Builder(
        builder: (ctx) {
          if (_category == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    BarsantiNetworkImage(
                      imageUrl: _category!.imageUrl,
                      width: double.infinity,
                      height: 300,
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        child: BarsantiButton(
                          icon: BarsantiIcons.arrow_back,
                          onTap: () => context.router.pop(),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 12,
                      left: 0,
                      right: 0,
                      child: Text(
                        _category!.name,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
