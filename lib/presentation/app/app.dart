import 'package:flutter/material.dart';
import 'package:musify_mobile/presentation/app/navigation/app_router.gr.dart';
import 'package:musify_mobile/presentation/di/injection.dart';
import 'package:musify_mobile/presentation/theme/theme_provider.dart';
import 'package:musify_mobile/presentation/theme/themes.dart';

class MusifyApp extends StatefulWidget {
  const MusifyApp({Key? key}) : super(key: key);

  @override
  State<MusifyApp> createState() => _MusifyAppState();
}

class _MusifyAppState extends State<MusifyApp> {
  final _appRouter = i.get<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      theme: light,
      child: MaterialApp.router(
        theme: ThemeData(
          canvasColor: Colors.transparent,
          shadowColor: Colors.transparent,
          highlightColor: Colors.transparent,
          scaffoldBackgroundColor: Colors.black,
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          progressIndicatorTheme: ProgressIndicatorThemeData(
            circularTrackColor: Colors.greenAccent[700],
            color: Colors.greenAccent[400],
            linearMinHeight: 10,
          ),
          textTheme: const TextTheme(
            headline4: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontFamily: 'Proxima Bold',
              fontWeight: FontWeight.w600,
            ),
            bodyText1: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          primarySwatch: Colors.blue,
        ),
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}
