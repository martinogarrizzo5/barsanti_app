import "package:auto_route/auto_route.dart";
import "package:barsanti_app/data/models/news_intro/news_intro.dart";
import "package:barsanti_app/presentation/theme/barsanti_icons.dart";
import "package:barsanti_app/presentation/theme/colors.dart";
import "package:barsanti_app/presentation/theme/styles.dart";
import "package:barsanti_app/presentation/widgets/network_image.dart";
import "package:barsanti_app/routes/router.gr.dart";
import "package:barsanti_app/utils/formatters.dart";
import "package:flutter/material.dart";

class MiniNewsCard extends StatelessWidget {
  final NewsIntro news;

  const MiniNewsCard(this.news, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => context.router.navigate(
        NewsDetailsScreenRoute(newsId: news.id),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: BarsantiNetworkImage(
              imageUrl: news.imageUrl,
              height: 100,
              width: 100,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  news.category.name,
                  style: BarsantiStyles.miniNewsCategory,
                ),
                Text(
                  news.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: BarsantiStyles.miniNewsTitle,
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    const Icon(
                      BarsantiIcons.calendar,
                      color: BarsantiColors.subTitleLight,
                      size: 18,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      Formatters.formatDate(context, news.date),
                      style: BarsantiStyles.miniNewsDate,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
