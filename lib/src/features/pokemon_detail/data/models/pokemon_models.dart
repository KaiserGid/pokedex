import 'package:pokedex/src/features/pokemon_detail/domain/entities/pokemon_entity.dart';

class PokemonModel extends PokemonEntity {
  PokemonModel(
      {required super.name,
      required super.urlImage,
      required super.types,
      required super.abilities,
      required super.height,
      required super.weight,
      required super.color,
      required super.gender});

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      name: json['name'],
      urlImage: json['sprites']['other']['official-artwork']['front_default'],
      types: json['types'],
      abilities: json['abilities'],
      height: json['height'],
      weight: json['weight'],

      color: json['species'], gender: '',
      //!TODO fazer enum para pegar cor de acordo com a cor da specie
    );
  }
}
