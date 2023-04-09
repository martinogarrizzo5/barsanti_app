import 'package:auto_route/auto_route.dart';
import 'package:barsanti_app/data/models/news_intro/news_intro.dart';
import 'package:barsanti_app/presentation/theme/colors.dart';
import 'package:barsanti_app/presentation/theme/styles.dart';
import 'package:barsanti_app/presentation/widgets/network_image.dart';
import 'package:barsanti_app/routes/router.gr.dart';
import 'package:barsanti_app/utils/formatters.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  static const _defaultHeight = 250.0;
  final double? height;
  final NewsIntro news;

  const NewsCard(this.news, {super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height ?? _defaultHeight,
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
                    style: AppStyles.newsCategory,
                  ),
                  Text(
                    news.title,
                    style: AppStyles.newsTitle,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        color: AppColors.subTitleDark,
                        size: 18,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        Formatters.formatDate(context, news.date),
                        style: AppStyles.newsDate,
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
