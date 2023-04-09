import "package:auto_route/auto_route.dart";
import "package:barsanti_app/data/api/news_repo.dart";
import "package:barsanti_app/data/models/news_intro/news_intro.dart";
import "package:barsanti_app/presentation/theme/colors.dart";
import "package:barsanti_app/presentation/theme/scroll.dart";
import "package:barsanti_app/presentation/widgets/mini_news_card.dart";
import 'package:barsanti_app/presentation/widgets/news_indicators.dart';
import "package:barsanti_app/presentation/widgets/placeholders.dart";
import "package:barsanti_app/presentation/widgets/search_bar.dart";
import "package:flutter/material.dart";
import "package:get_it/get_it.dart";
import "package:infinite_scroll_pagination/infinite_scroll_pagination.dart";
import "package:shimmer/shimmer.dart";

@RoutePage()
class SearchScreen extends StatefulWidget {
  final String? searchedText;

  const SearchScreen({super.key, this.searchedText});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final PagingController<int, NewsIntro> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();
    _searchController.text = widget.searchedText ?? "";
    _pagingController.addPageRequestListener((page) {
      _fetchPage(page);
    });
  }

  Future<void> _fetchPage(int page) async {
    try {
      final newsRepo = GetIt.I.get<NewsRepository>();
      final news =
          await newsRepo.getNews(search: _searchController.text, page: page);
      final introNews = news.map((e) => NewsIntro.fromNews(e)).toList();

      final isLastPage = news.length < Scroll.pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(introNews);
      } else {
        final nextPageKey = page + news.length;
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
      body: RefreshIndicator(
        onRefresh: () => Future.sync(
          () => _pagingController.refresh(),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: SafeArea(
            child: Column(
              children: [
                SearchBar(
                  controller: _searchController,
                  onSearch: (text) {
                    _pagingController.refresh();
                  },
                ),
                PagedListView<int, NewsIntro>(
                  shrinkWrap: true,
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    vertical: 32,
                  ),
                  pagingController: _pagingController,
                  builderDelegate: PagedChildBuilderDelegate<NewsIntro>(
                    itemBuilder: (context, item, index) => Column(
                      children: [
                        MiniNewsCard(item),
                        const SizedBox(height: 24),
                      ],
                    ),
                    noItemsFoundIndicatorBuilder: (ctx) => const NoNewsFound(),
                    newPageProgressIndicatorBuilder: (ctx) {
                      return _buildPlaceholder();
                    },
                    firstPageProgressIndicatorBuilder: (ctx) {
                      return _buildPlaceholder();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
