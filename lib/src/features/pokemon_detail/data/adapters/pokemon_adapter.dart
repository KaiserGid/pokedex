import 'package:pokedex/src/features/pokemon_detail/data/models/pokemon_models.dart';
import 'package:pokedex/src/features/pokemon_detail/domain/entities/pokemon_entity.dart';

class PokemonAdpter {
  static adapter(PokemonModel pokemon) {
    return PokemonEntity(
        name: pokemon.name,
        urlImage: pokemon.urlImage,
        types: pokemon.types,
        abilities: pokemon.abilities,
        height: pokemon.height,
        weight: pokemon.weight);
  }
}
