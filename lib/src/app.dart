import 'package:flutter/material.dart';
import 'package:pokedex/src/features/home/pages/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
          brightness: Brightness.light,
          textTheme: const TextTheme(
            titleLarge: TextStyle(color: Colors.white),
            titleSmall: TextStyle(color: Colors.white),
            labelSmall: TextStyle(color: Colors.white),
          ),
          iconTheme: const IconThemeData(color: Colors.white)),
      home: const HomePage(),
    );
  }
}
