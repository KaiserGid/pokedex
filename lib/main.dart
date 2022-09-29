import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    getallPokemons();
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: FutureBuilder<List<PokemonModel>>(
              future: getallPokemons(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (_, index) => ListTile(
                          subtitle: Text('URL : ${snapshot.data![index].url}'),
                          title: Text(snapshot.data![index].name)));
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('Sem dados'),
                  );
                }
                return const CircularProgressIndicator();
              }),
        ));
  }
}

fetchDio(int numberPage) async {
  var result = await Dio()
      .get('https://pokeapi.co/api/v2/pokemon/?limit=100&offset=$numberPage');
  debugPrint(result.data.toString());
  return result.data['results'];
}

Future<List<PokemonModel>> getallPokemons() async {
  List<PokemonModel> pokemons = [];
  int numberPage = 0;
  for (var pokemon in await fetchDio(numberPage)) {
    pokemons.add(
      PokemonModel(name: pokemon['name'], url: pokemon['url']),
    );
    numberPage += 1;
  }
  return pokemons;
}

class PokemonModel {
  String name;
  String url;
  PokemonModel({
    required this.name,
    required this.url,
  });

  PokemonModel copyWith({
    String? name,
    String? url,
  }) {
    return PokemonModel(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'url': url});

    return result;
  }

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(
      name: map['name'] ?? '',
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonModel.fromJson(String source) =>
      PokemonModel.fromMap(json.decode(source));

  @override
  String toString() => 'PokemonModel(name: $name, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PokemonModel && other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
