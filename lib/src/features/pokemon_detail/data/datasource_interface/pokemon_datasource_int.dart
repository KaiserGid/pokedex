import 'package:pokedex/src/features/pokemon_detail/data/models/pokemon_models.dart';

abstract class IDataSource {
  Future<Map<String, dynamic>> fetchData();
  Future<List<PokemonModel>> fetchPokemonsData();
}
