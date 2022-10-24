import 'package:pokedex/src/features/pokemon_detail/domain/entities/pokemon_entity.dart';

abstract class IPokemonRepository {
  Future<List<PokemonEntity>> pokemons();
}
