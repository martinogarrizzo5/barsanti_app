import 'package:auto_route/auto_route.dart';
import 'package:barsanti_app/data/api/news_repo.dart';
import 'package:barsanti_app/data/models/news/news.dart';
import 'package:barsanti_app/presentation/theme/barsanti_icons.dart';
import 'package:barsanti_app/presentation/theme/colors.dart';
import 'package:barsanti_app/presentation/theme/styles.dart';
import 'package:barsanti_app/presentation/widgets/button.dart';
import 'package:barsanti_app/presentation/widgets/html_rich_text.dart';
import 'package:barsanti_app/presentation/widgets/network_image.dart';
import 'package:barsanti_app/presentation/widgets/placeholders.dart';
import 'package:barsanti_app/utils/formatters.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shimmer/shimmer.dart';

@RoutePage()
class NewsDetailsScreen extends StatefulWidget {
  final int newsId;
  const NewsDetailsScreen({
    super.key,
    @pathParam required this.newsId,
  });

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  late Future<News> _newsRequest;

  @override
  void initState() {
    super.initState();
    final newsRepo = GetIt.I.get<NewsRepository>();
    _newsRequest = newsRepo.getNewsById(widget.newsId);
  }

  Widget _buildPlaceholder() {
    return Shimmer.fromColors(
      baseColor: BarsantiColors.tile,
      highlightColor: BarsantiColors.shimmerColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...const [
            TextPlaceholder(),
            SizedBox(height: 12),
            TextPlaceholder(
              width: double.infinity,
            ),
            SizedBox(height: 12),
            TextPlaceholder(width: 120),
            SizedBox(height: 24),
            ImagePlaceholder(width: double.infinity, height: 250),
            SizedBox(height: 24),
          ],
          for (int i = 0; i < 8; i++) ...const [
            SizedBox(height: 12),
            TextPlaceholder(width: double.infinity),
          ]
        ],
      ),
    );
  }

  Widget _buildNewsContent(News news) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          news.category.name,
          style: BarsantiStyles.newsDetailsCategory,
        ),
        Text(
          news.title,
          style: BarsantiStyles.newsDetailsTitle,
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            const Icon(
              BarsantiIcons.calendar,
              color: BarsantiColors.subTitleLight,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              Formatters.formatDate(context, news.date),
              style: BarsantiStyles.miniNewsDate,
            ),
          ],
        ),
        const SizedBox(height: 16),
        BarsantiNetworkImage(
          imageUrl: news.imageUrl,
          width: double.infinity,
          height: 250,
          borderRadius: BorderRadius.circular(12),
        ),
        const SizedBox(height: 24),
        HTMLRichText(news.description),
        const SizedBox(height: 16),
        for (final file in news.files) ...[
          Card(
            color: BarsantiColors.tile,
            child: InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.file_present_outlined,
                      color: BarsantiColors.text,
                      size: 24,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(file.name),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BarsantiButton(
                      icon: BarsantiIcons.arrow_back,
                      onTap: () => context.router.pop(),
                    ),
                    BarsantiButton(
                      icon: BarsantiIcons.bookmark_outline,
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                FutureBuilder(
                  future: _newsRequest,
                  builder: (ctx, snap) {
                    switch (snap.connectionState) {
                      case ConnectionState.waiting:
                        return _buildPlaceholder();
                      case ConnectionState.done:
                      default:
                        if (snap.hasError) {
                          debugPrint(snap.error.toString());
                          // TODO: handle error
                          return const Center(child: Text("Errore"));
                        }
                        return _buildNewsContent(snap.data!);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
