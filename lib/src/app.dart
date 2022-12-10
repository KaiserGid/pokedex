import 'package:flutter/material.dart';
import 'package:pokedex/src/features/pokemon_detail/presenter/pages/pokemons.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
          brightness: Brightness.light,
          textTheme: const TextTheme(
            titleLarge: TextStyle(color: Colors.white, fontFamily: 'Oswald'),
            titleSmall: TextStyle(color: Colors.white, fontFamily: 'Oswald'),
            labelSmall: TextStyle(color: Colors.white, fontFamily: 'Oswald'),
            labelMedium: TextStyle(color: Colors.white, fontFamily: 'Oswald'),
            labelLarge: TextStyle(color: Colors.white, fontFamily: 'Oswald'),
          ),
          iconTheme: const IconThemeData(color: Colors.white)),
      home: const Pokemons(),
    );
  }
}
