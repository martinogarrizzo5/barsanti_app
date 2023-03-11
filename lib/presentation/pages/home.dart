import 'package:barsanti_app/data/api/categories_repo.dart';
import 'package:barsanti_app/data/api/news_repo.dart';
import 'package:barsanti_app/data/models/home_data/home_data.dart';
import 'package:barsanti_app/presentation/theme/colors.dart';
import 'package:barsanti_app/presentation/theme/scroll.dart';
import 'package:barsanti_app/presentation/theme/styles.dart';
import 'package:barsanti_app/presentation/widgets/mini_news_card.dart';
import 'package:barsanti_app/presentation/widgets/news_card.dart';
import 'package:barsanti_app/presentation/widgets/placeholders.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import "package:carousel_slider/carousel_slider.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CarouselController _carouselController = CarouselController();
  late Future<HomeData> _homeDataRequest;
  double _page = 0;

  @override
  void initState() {
    super.initState();
    _homeDataRequest = GetIt.I.get<NewsRepository>().getHomeData();
  }

  Future<void> refreshHomeData() async {
    setState(() {
      _homeDataRequest = GetIt.I.get<NewsRepository>().getHomeData();
      _page = 0;
    });
  }

  Widget _buildPlaceholder() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: BarsantiStyles.scaffoldYPadding,
        horizontal: 24,
      ),
      child: Shimmer.fromColors(
        baseColor: BarsantiColors.tile,
        highlightColor: BarsantiColors.shimmerColor,
        period: const Duration(milliseconds: 1200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...const [
              Text("Caricamento...", style: BarsantiStyles.title),
              SizedBox(height: 12),
              BigNewsPlaceholder(),
              SizedBox(height: 18),
            ],
            Align(
              alignment: Alignment.center,
              child: SmoothIndicator(
                offset: 2,
                count: 5,
                effect: Scroll.dotsIndicatorEffect(),
              ),
            ),
            ...const [
              SizedBox(height: 24),
              Text("Caricamento...", style: BarsantiStyles.title),
              SizedBox(height: 12),
              MiniNewsPlaceholder(),
              SizedBox(height: 24),
              MiniNewsPlaceholder(),
              SizedBox(height: 24),
              MiniNewsPlaceholder(),
            ]
          ],
        ),
      ),
    );
  }

  Widget _buildHome(HomeData homeData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.0),
          child: Text("In Evidenza", style: BarsantiStyles.title),
        ),
        const SizedBox(height: 12),
        CarouselSlider(
          carouselController: _carouselController,
          items:
              homeData.highlightedNews.map((news) => NewsCard(news)).toList(),
          options: CarouselOptions(
              height: 250,
              viewportFraction: 0.9,
              enlargeFactor: 0.3,
              enlargeCenterPage: true,
              autoPlay: true,
              onPageChanged: (page, reason) {
                setState(() {
                  _page = page * 1.0; // * 1.0 to convert to double
                });
              }),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 18),
              Align(
                alignment: Alignment.center,
                child: SmoothIndicator(
                  offset: _page,
                  count: homeData.highlightedNews.length,
                  effect: Scroll.dotsIndicatorEffect(),
                  onDotClicked: (pageIndex) {
                    _carouselController.animateToPage(
                      pageIndex,
                      curve: Curves.fastOutSlowIn,
                      duration: const Duration(milliseconds: 500),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              const Text("Eventi", style: BarsantiStyles.title),
              const SizedBox(height: 12),
              for (final news in homeData.latestNews) ...[
                MiniNewsCard(news),
                const SizedBox(height: 24),
              ]
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: refreshHomeData,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: 180,
                  ),
                ),
                FutureBuilder(
                  future: _homeDataRequest,
                  builder: (ctx, snap) {
                    if (snap.hasError) {
                      debugPrint(snap.error.toString());
                      return Text("something went wrong");
                    }
                    if (snap.connectionState == ConnectionState.done) {
                      return _buildHome(snap.data!);
                    }

                    return _buildPlaceholder();
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
