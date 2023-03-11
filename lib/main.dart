import 'package:barsanti_app/data/api/categories_repo.dart';
import 'package:barsanti_app/data/api/news_repo.dart';
import 'package:barsanti_app/presentation/theme/theme.dart';
import 'package:barsanti_app/routes/router.gr.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import "package:get_it/get_it.dart";

void main() {
  GetIt.I.registerSingleton(CategoriesRepository());
  GetIt.I.registerSingleton(NewsRepository());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: BarsantiTheme.get(),
      debugShowCheckedModeBanner: false,
      title: 'Barsanti App',
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('it', 'IT'),
      ],
    );
  }
}
