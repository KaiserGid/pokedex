import 'package:flutter/material.dart';
import 'package:pokedex/src/features/pokemon_detail/domain/entities/pokemon_entity.dart';
import 'package:pokedex/src/features/pokemon_detail/presenter/pages/pokemon_detail_page.dart';

import '../../data/repositories_imp/pokemon_repository_imp.dart';
import '../../domain/usercases/pokemon/get_all_pokemon_usecase.dart';
import '../../external/pokemon_datasource.dart';

class PokemonsPage extends StatefulWidget {
  const PokemonsPage({Key? key}) : super(key: key);

  @override
  State<PokemonsPage> createState() => _PokemonsPageState();
}

class _PokemonsPageState extends State<PokemonsPage> {
  @override
  Widget build(BuildContext context) {
    final PokemonDataSource dataSource = PokemonDataSource();
    final PokemonRepositoryImp pokemonRepository =
        PokemonRepositoryImp(dataSource: dataSource);
    final GetAllpokemonsUsecase getPokemon =
        GetAllpokemonsUsecase(pokemonRepository: pokemonRepository);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Pokemons'),
          foregroundColor: Colors.blue,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: FutureBuilder<List<PokemonEntity>>(
            future: getPokemon(),
            builder: (context, snapshot) => snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.hasData ? snapshot.data!.length : 0,
                    itemBuilder: ((context, index) => CustomCard(
                          pokemon: snapshot.data![index],
                        )),
                  )
                : const Center(
                    child: PokemonProgressIndicator(),
                  )));
  }
}

class CustomCard extends StatelessWidget {
  final PokemonEntity pokemon;

  const CustomCard({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return ListTile(
    //     onTap: () => Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //             builder: (context) => HomePage(pokemon: pokemon))),
    //     title: Text(pokemon.name.toUpperCase()),
    //     subtitle: Text(pokemon.types[0].name),
    //     trailing: Text('${pokemon.weight.toString()} Kg'),
    //     leading: Image.network(pokemon.urlImage));
    return Padding(
      padding: const EdgeInsets.only(top: 8, right: 16),
      child: GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PokemonDetailPage(pokemon: pokemon))),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundColor: getColor(pokemon),
                child: Image.network(
                  scale: 1.0,
                  pokemon.urlImage,
                  loadingBuilder: (context, child, loadingProgress) =>
                      loadingProgress == null
                          ? child
                          : const CircularProgressIndicator(),
                ),
              ),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  pokemon.name.toUpperCase(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'Oswald',
                  ),
                ),
                Text(pokemon.types[0].name)
              ]),
              Text('${pokemon.weight.toString()} Kg')
            ],
          ),
        ),
      ),
    );
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
