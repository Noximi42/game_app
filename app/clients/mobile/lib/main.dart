import 'package:flutter/material.dart';
import 'package:mobile/screens/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile/state/game_state.dart';
import 'package:mobile/state/user_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => UserState()),
      ChangeNotifierProvider(create: (context) => GameState()),
    ],
    child: const GameApp(),
  ));
}

class GameApp extends StatelessWidget {
  const GameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.black,
            primary: Colors.black,
            secondary: Colors.white,
            brightness: Brightness.light),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.white,
            primary: Colors.white,
            secondary: Colors.black,
            brightness: Brightness.dark),
        scaffoldBackgroundColor: Colors.black,
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      themeMode: ThemeMode.dark,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('de'),
      ],
      home: const InitStateFromDb(initialAppWidget: HomeScreen()),
    );
  }
}

class InitStateFromDb extends StatelessWidget {
  final Widget initialAppWidget;

  const InitStateFromDb({super.key, required this.initialAppWidget});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<UserState>(context, listen: false).loadFromDb(),
      builder: (context, snapshot) {
        if (snapshot.hasData) return initialAppWidget;

        return Scaffold(
            body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    AppLocalizations.of(context)!.loading,
                  ))
            ],
          ),
        ));
      },
    );
  }
}
