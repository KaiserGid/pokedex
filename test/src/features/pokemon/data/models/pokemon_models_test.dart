import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/src/features/pokemon_detail/data/models/pokemon_models.dart';
import 'package:pokedex/src/features/pokemon_detail/domain/entities/pokemon_entity.dart';

void main() {
  PokemonModel pokemon;

  test('Should a subclass of type Entity', () {
    pokemon = PokemonModel(
        name: 'name',
        urlImage: 'urlImage',
        types: [],
        abilities: [],
        height: 5.5,
        weight: 6.6,
        color: 'greem',
        gender: '');
    expect(pokemon, isA<PokemonEntity>());
  });

  test(
    'Shold convert Map of the PokemonModel',
    () {},
  );
}
