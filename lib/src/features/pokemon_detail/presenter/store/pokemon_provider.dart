import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:pokedex/src/features/pokemon_detail/domain/entities/pokemon_entity.dart';

import '../../data/repositories_imp/pokemon_repository_imp.dart';
import '../../domain/usercases/pokemon/get_all_pokemon_usecase.dart';
import '../../external/pokemon_datasource.dart';

class PokemonProvider extends ChangeNotifier {
  List<PokemonEntity> _pokemons = [];

  UnmodifiableListView<PokemonEntity> get pokemons =>
      UnmodifiableListView(_pokemons);

  void getPokemons() async {
    final PokemonDataSource dataSource = PokemonDataSource();
    final PokemonRepositoryImp pokemonRepository =
        PokemonRepositoryImp(dataSource: dataSource);
    final GetAllpokemonsUsecase getPokemon =
        GetAllpokemonsUsecase(pokemonRepository: pokemonRepository);

    _pokemons = await getPokemon.call();

    notifyListeners();
  }
}
