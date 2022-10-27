import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/src/features/pokemon_detail/domain/entities/pokemon_entity.dart';
import 'package:pokedex/src/features/pokemon_detail/domain/entities/values_objects/pokemon_abilities_value_object.dart';
import 'package:pokedex/src/features/pokemon_detail/domain/entities/values_objects/pokemon_types_value_objects.dart';
import 'package:pokedex/src/features/pokemon_detail/domain/repository_interfaces/pokemon_reposity.dart';
import 'package:pokedex/src/features/pokemon_detail/domain/usercases/pokemon/get_all_pokemon_usecase.dart';

class MockPokemonRepository extends Mock implements IPokemonRepository {}

void main() {
  test(
    'should a list pokemons',
    () async {
      final IPokemonRepository pokemonRepository = MockPokemonRepository();
      final IGetAllPokemonsUsecase getAllPokemonsUsecase =
          GetAllpokemonsUsecase(pokemonRepository: pokemonRepository);

      when((() => pokemonRepository.pokemons())).thenAnswer((_) async => [
            PokemonEntity(
              name: 'name',
              urlImage: 'urlImage',
              types: <TypesEntity>[],
              abilities: <Ability>[],
              height: 8.0,
              weight: 5.6,
            ),
            PokemonEntity(
              name: 'name2',
              urlImage: 'urlImage2',
              types: <TypesEntity>[],
              abilities: <Ability>[],
              height: 2.0,
              weight: 1.6,
            ),
          ]);

      final list = await getAllPokemonsUsecase.call();

      expect(list.isNotEmpty, equals(true));
      expect(list.length, equals(2));
      expect(list[0].name, equals('name'));
    },
  );
}
