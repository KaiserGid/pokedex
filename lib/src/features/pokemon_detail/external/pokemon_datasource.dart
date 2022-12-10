import 'package:dio/dio.dart';
import 'package:pokedex/src/features/pokemon_detail/data/datasource_interface/pokemon_datasource_int.dart';
import 'package:pokedex/src/features/pokemon_detail/data/models/pokemon_models.dart';
import 'package:pokedex/src/features/pokemon_detail/data/models/value_objects_models/type_model.dart';

import '../data/models/value_objects_models/ability_model.dart';

class PokemonDataSource implements IDataSource {
  @override
  Future<Map<String, dynamic>> fetchData() async {
    Dio dio = Dio();
    Response response =
        await dio.get('https://pokeapi.co/api/v2/pokemon?offset=0&limit=50');
    return response.data;
  }

  @override
  Future<List<PokemonModel>> fetchPokemonsData() async {
    Dio dio = Dio();

    Map<String, dynamic> pokemonData = await fetchData();

    List<PokemonModel> pokemonsModels = [];
    for (var element in await pokemonData['results']) {
      Response pokemonResponse = await dio.get(element['url']);

      Response colorResponse =
          await dio.get(pokemonResponse.data['species']['url']);

      List<AbilityModel> abilities = [];
      for (var ability in await pokemonResponse.data['abilities']) {
        abilities.add(AbilityModel(name: ability['ability']['name']));
      }

      List<TypeModel> types = [];
      for (var type in await pokemonResponse.data['types']) {
        types.add(TypeModel(name: type['type']['name']));
      }

      pokemonsModels.add(PokemonModel(
        name: await pokemonResponse.data['name'],
        urlImage: await pokemonResponse.data['sprites']['other']
            ["official-artwork"]['front_default'],
        types: types,
        abilities: abilities,
        height: double.parse((pokemonResponse.data['height'] / 10).toString()),
        weight: double.parse((pokemonResponse.data['weight'] / 10).toString()),
        color: await colorResponse.data['color']['name'],
        gender: '',
      ));
    }
    return pokemonsModels;
  }
}
