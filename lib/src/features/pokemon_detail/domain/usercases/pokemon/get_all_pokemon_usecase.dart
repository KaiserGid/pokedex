import 'package:pokedex/src/features/pokemon_detail/domain/entities/pokemon_entity.dart';
import 'package:pokedex/src/features/pokemon_detail/domain/repository_interfaces/pokemon_reposity.dart';

abstract class IGetAllPokemonsUsecase {
  Future<List<PokemonEntity>> call();
}

class GetAllpokemonsUsecase implements IGetAllPokemonsUsecase {
  IPokemonRepository pokemonRepository;

  GetAllpokemonsUsecase({
    required this.pokemonRepository,
  });

  @override
  Future<List<PokemonEntity>> call() async {
    return await pokemonRepository.pokemons();
  }
}
