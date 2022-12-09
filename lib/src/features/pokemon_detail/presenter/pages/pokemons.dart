import 'package:flutter/material.dart';
import 'package:pokedex/src/features/pokemon_detail/domain/entities/pokemon_entity.dart';
import 'package:pokedex/src/features/pokemon_detail/presenter/pages/home_page.dart';

import '../../data/repositories_imp/pokemon_repository_imp.dart';
import '../../domain/usercases/pokemon/get_all_pokemon_usecase.dart';
import '../../external/pokemon_datasource.dart';

class Pokemons extends StatefulWidget {
  const Pokemons({Key? key}) : super(key: key);

  @override
  State<Pokemons> createState() => _PokemonsState();
}

class _PokemonsState extends State<Pokemons> {
  @override
  Widget build(BuildContext context) {
    final PokemonDataSource dataSource = PokemonDataSource();
    final PokemonRepositoryImp pokemonRepository =
        PokemonRepositoryImp(dataSource: dataSource);
    final GetAllpokemonsUsecase getPokemon =
        GetAllpokemonsUsecase(pokemonRepository: pokemonRepository);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Pokedex'),
        ),
        body: FutureBuilder<List<PokemonEntity>>(
            future: getPokemon.call(),
            builder: (context, snapshot) => snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.hasData ? snapshot.data!.length : 0,
                    itemBuilder: ((context, index) => Column(
                          children: [
                            ListTile(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage(
                                            pokemon: snapshot.data![index]))),
                                title: Text(
                                    snapshot.data![index].name.toUpperCase()),
                                subtitle:
                                    Text(snapshot.data![index].types[0].name),
                                trailing: Text(
                                    '${snapshot.data![index].weight.toString()} Kg'),
                                leading: Image.network(
                                    snapshot.data![index].urlImage)),
                            // Text(snapshot.data![index].abilities[0].name),
                          ],
                        )),
                  )
                : const Center(
                    child: PokemonProgressIndicator(),
                  )));
  }
}

class PokemonProgressIndicator extends StatelessWidget {
  const PokemonProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/loading.gif',
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
