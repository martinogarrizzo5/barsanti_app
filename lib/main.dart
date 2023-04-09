import 'package:barsanti_app/business_logic/download_provider.dart';
import 'package:barsanti_app/business_logic/favorites_provider.dart';
import 'package:barsanti_app/data/api/categories_repo.dart';
import 'package:barsanti_app/data/api/news_repo.dart';
import 'package:barsanti_app/presentation/theme/theme.dart';
import 'package:barsanti_app/routes/router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import "package:get_it/get_it.dart";
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  GetIt.I.registerSingleton(CategoriesRepository());
  GetIt.I.registerSingleton(NewsRepository());
  await FlutterDownloader.initialize(debug: kDebugMode, ignoreSsl: kDebugMode);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
        ChangeNotifierProvider(create: (_) => DownloadProvider())
      ],
      child: MaterialApp.router(
        theme: AppTheme.get(),
        debugShowCheckedModeBanner: false,
        title: 'Barsanti App',
        routerConfig: _appRouter.config(),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('it', 'IT'),
        ],
      ),
    );
  }
}
