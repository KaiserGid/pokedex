import 'package:pokedex/src/features/pokemon_detail/data/adapters/pokemon_adapter.dart';
import 'package:pokedex/src/features/pokemon_detail/data/datasource_interface/pokemon_datasource_int.dart';
import 'package:pokedex/src/features/pokemon_detail/data/models/pokemon_models.dart';
import 'package:pokedex/src/features/pokemon_detail/domain/entities/pokemon_entity.dart';
import 'package:pokedex/src/features/pokemon_detail/domain/repository_interfaces/pokemon_reposity.dart';

class PokemonRepositoryImp implements IPokemonRepository {
  IDataSource dataSource;

  PokemonRepositoryImp({
    required this.dataSource,
  });

  @override
  Future<List<PokemonEntity>> pokemons() async {
    List<PokemonModel> pokemonsData = await dataSource.fetchPokemonsData();

    List<PokemonEntity> listOfPokemons = [];

    for (var pokemon in pokemonsData) {
      listOfPokemons.add(PokemonAdpter.adapter(pokemon));
    }

    return listOfPokemons;
  }
}
