import 'package:auto_route/auto_route.dart';
import 'package:barsanti_app/data/api/categories_repo.dart';
import 'package:barsanti_app/data/api/news_repo.dart';
import 'package:barsanti_app/data/models/category/category.dart';
import 'package:barsanti_app/data/models/news/news.dart';
import 'package:barsanti_app/data/models/news_intro/news_intro.dart';
import 'package:barsanti_app/presentation/theme/barsanti_icons.dart';
import 'package:barsanti_app/presentation/theme/colors.dart';
import 'package:barsanti_app/presentation/theme/scroll.dart';
import 'package:barsanti_app/presentation/theme/settings.dart';
import 'package:barsanti_app/presentation/theme/styles.dart';
import 'package:barsanti_app/presentation/widgets/button.dart';
import 'package:barsanti_app/presentation/widgets/mini_news_card.dart';
import 'package:barsanti_app/presentation/widgets/network_image.dart';
import 'package:barsanti_app/presentation/widgets/news_card.dart';
import 'package:barsanti_app/presentation/widgets/news_indicators.dart';
import 'package:barsanti_app/presentation/widgets/placeholders.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shimmer/shimmer.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

@RoutePage()
class CategoryScreen extends StatefulWidget {
  final Category category;

  const CategoryScreen({super.key, required this.category});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late Category _category;

  final PagingController<int, NewsIntro> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((page) {
      _fetchPage(page);
    });
    _category = widget.category;
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Future<void> _fetchPage(int page) async {
    try {
      final newsRepo = GetIt.I.get<NewsRepository>();
      final news = await newsRepo.getNews(
          category: widget.category.id, page: page, take: AppSettings.pageSize);
      final introNews = news.map((e) => NewsIntro.fromNews(e)).toList();

      final isLastPage = news.length < AppSettings.pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(introNews);
      } else {
        final nextPageKey = page + 1;
        _pagingController.appendPage(introNews, nextPageKey);
      }
    } catch (err) {
      _pagingController.error = err;
    }
  }

  Widget _buildPlaceholder() {
    return Shimmer.fromColors(
      baseColor: AppColors.tile,
      highlightColor: AppColors.shimmerColor,
      period: const Duration(milliseconds: 1200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          MiniNewsPlaceholder(),
          SizedBox(height: 24),
          MiniNewsPlaceholder(),
          SizedBox(height: 24),
          MiniNewsPlaceholder(),
          SizedBox(height: 24),
          MiniNewsPlaceholder(),
          SizedBox(height: 24),
          MiniNewsPlaceholder(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (ctx) {
          const imageHeight = 250.0;

          return RefreshIndicator(
            onRefresh: () => Future.sync(
              () => _pagingController.refresh(),
            ),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Stack(
                    children: [
                      BarsantiNetworkImage(
                        imageUrl: _category.imageUrl,
                        width: double.infinity,
                        height: imageHeight,
                      ),
                      Container(
                        width: double.infinity,
                        height: imageHeight,
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
                      SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 16,
                          ),
                          child: BarsantiButton(
                            icon: AppIcons.arrow_back,
                            onTap: () => context.router.pop(),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 0,
                        right: 0,
                        child: Text(
                          _category.name,
                          textAlign: TextAlign.center,
                          style: AppStyles.categoryTitle,
                        ),
                      ),
                    ],
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 24,
                    horizontal: 24,
                  ),
                  sliver: PagedSliverList<int, NewsIntro>(
                    pagingController: _pagingController,
                    builderDelegate: PagedChildBuilderDelegate<NewsIntro>(
                      itemBuilder: (context, item, index) => Column(
                        children: [
                          MiniNewsCard(item),
                          const SizedBox(height: 24),
                        ],
                      ),
                      noItemsFoundIndicatorBuilder: (ctx) =>
                          const NoNewsFound(),
                      newPageProgressIndicatorBuilder: (ctx) {
                        return _buildPlaceholder();
                      },
                      firstPageProgressIndicatorBuilder: (ctx) {
                        return _buildPlaceholder();
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
