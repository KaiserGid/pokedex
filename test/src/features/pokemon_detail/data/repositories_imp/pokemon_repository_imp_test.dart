import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/src/features/pokemon_detail/data/datasource_interface/pokemon_datasource_int.dart';
import 'package:pokedex/src/features/pokemon_detail/data/models/pokemon_models.dart';
import 'package:pokedex/src/features/pokemon_detail/data/repositories_imp/pokemon_repository_imp.dart';
import 'package:pokedex/src/features/pokemon_detail/domain/entities/pokemon_entity.dart';
import 'package:pokedex/src/features/pokemon_detail/domain/repository_interfaces/pokemon_reposity.dart';

class MockDataSource extends Mock implements IDataSource {}

void main() {
  late final IDataSource dataSource;
  late final IPokemonRepository pokemonRepository;

  setUp(() {
    dataSource = MockDataSource();
    pokemonRepository = PokemonRepositoryImp(dataSource: dataSource);
  });

  test(
    'Should a list pokemons Entity',
    () async {
      when(() => dataSource.fetchPokemonsData()).thenAnswer((_) async => [
            PokemonModel(
                name: 'joão',
                urlImage: 'http://teste.com.br',
                types: [],
                abilities: [],
                height: 8.0,
                weight: 8.0),
            PokemonModel(
                name: 'bolado',
                urlImage: 'http://teste.com.br',
                types: [],
                abilities: [],
                height: 1.0,
                weight: 3.0),
          ]);

      final List<PokemonEntity> list = await pokemonRepository.pokemons();

      expect(list.isNotEmpty, equals(true));
    },
  );
}
