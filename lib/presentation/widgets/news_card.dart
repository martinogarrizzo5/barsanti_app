import 'package:auto_route/auto_route.dart';
import 'package:barsanti_app/data/models/news_intro/news_intro.dart';
import 'package:barsanti_app/presentation/theme/colors.dart';
import 'package:barsanti_app/presentation/theme/styles.dart';
import 'package:barsanti_app/presentation/widgets/network_image.dart';
import 'package:barsanti_app/routes/router.gr.dart';
import 'package:barsanti_app/utils/formatters.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final NewsIntro news;

  const NewsCard(this.news, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          children: [
            BarsantiNetworkImage(
              imageUrl: news.imageUrl,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            // backdrop filter is used to blur the background

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.category.name,
                    style: BarsantiStyles.newsCategory,
                  ),
                  Text(
                    news.title,
                    style: BarsantiStyles.newsTitle,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        color: BarsantiColors.subTitleDark,
                        size: 18,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        Formatters.formatDate(context, news.date),
                        style: BarsantiStyles.newsDate,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => context.router.navigate(
                  NewsDetailsRoute(newsId: news.id),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
