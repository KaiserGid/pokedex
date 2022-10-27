import 'package:pokedex/src/features/pokemon_detail/domain/entities/values_objects/pokemon_abilities_value_object.dart';
import 'package:pokedex/src/features/pokemon_detail/domain/entities/values_objects/pokemon_types_value_objects.dart';

class PokemonEntity {
  final String name;
  final String urlImage;
  final List<TypesEntity> types;
  final List<Ability> abilities;
  final double height;
  final double weight;

  PokemonEntity({
    required this.name,
    required this.urlImage,
    required this.types,
    required this.abilities,
    required this.height,
    required this.weight,
  });
}
