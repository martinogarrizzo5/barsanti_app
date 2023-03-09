import 'package:barsanti_app/presentation/theme/theme.dart';
import 'package:barsanti_app/routes/router.gr.dart';
import 'package:flutter/material.dart';

void main() {
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
    );
  }
}
