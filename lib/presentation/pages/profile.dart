import 'package:auto_route/auto_route.dart';
import 'package:barsanti_app/business_logic/favorites_provider.dart';
import 'package:barsanti_app/data/models/news/news.dart';
import 'package:barsanti_app/data/models/news_intro/news_intro.dart';
import 'package:barsanti_app/presentation/theme/barsanti_icons.dart';
import 'package:barsanti_app/presentation/theme/colors.dart';
import 'package:barsanti_app/presentation/theme/styles.dart';
import 'package:barsanti_app/presentation/widgets/network_error.dart';
import 'package:barsanti_app/presentation/widgets/news_card.dart';
import 'package:barsanti_app/presentation/widgets/placeholders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Future<void> _refresh(BuildContext context) async {
    final favProvider = context.read<FavoritesProvider>();
    await favProvider.refreshFavorites();
  }

  Widget _buildPlaceholder() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(height: 32),
            Text(
              "Elementi Salvati",
              style: AppStyles.title,
            ),
            SizedBox(height: 16),
            NewsListPlaceholder(),
          ],
        ),
      ),
    );
  }

  Widget _buildNoItem(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/images/empty-box.svg",
            height: 150,
            colorFilter: const ColorFilter.mode(
              AppColors.primary,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            "Nessun Elemento Salvato",
            style: AppStyles.title,
          ),
          const SizedBox(height: 8),
          ElevatedButton.icon(
            onPressed: () => context.tabsRouter.setActiveIndex(1),
            icon: const Icon(AppIcons.search),
            label: const Text("Esplora News"),
            style: AppStyles.button,
          )
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context, List<NewsIntro> news) {
    return RefreshIndicator(
      onRefresh: () => _refresh(context),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              const Text(
                "Elementi Salvati",
                style: AppStyles.title,
              ),
              const SizedBox(height: 16),
              ...news.map(
                (news) => Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: NewsCard(news),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final favProvider = context.watch<FavoritesProvider>();

    return Scaffold(
      body: Builder(
        builder: (ctx) {
          if (favProvider.error != null) {
            return NetworkError(
              padding: const EdgeInsets.only(top: 128.0),
              onRetry: () => favProvider.refreshFavorites(),
            );
          }
          if (favProvider.isFetching) {
            return _buildPlaceholder();
          }
          if (favProvider.favorites.isEmpty) {
            return _buildNoItem(context);
          }
          return _buildContent(context, favProvider.favorites);
        },
      ),
    );
  }
}
