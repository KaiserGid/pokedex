import 'package:flutter/material.dart';
import 'package:pokedex/src/features/pokemon_detail/domain/entities/pokemon_entity.dart';
import 'package:pokedex/src/features/pokemon_detail/presenter/widgets/classification_status_widget.dart';
import 'package:pokedex/src/features/pokemon_detail/presenter/widgets/image_header_widget.dart';
import 'package:pokedex/src/features/pokemon_detail/presenter/widgets/name_and%20types_widget.dart';
import 'package:pokedex/src/features/pokemon_detail/presenter/widgets/pokemon_details_widget.dart';

class PokemonDetailPage extends StatefulWidget {
  final PokemonEntity pokemon;

  const PokemonDetailPage({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: getColor(widget.pokemon),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          // title: Text(
          //   'Detalhes',
          //   style: Theme.of(context).textTheme.titleSmall,
          // ),
          centerTitle: false,
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back_ios_new_rounded)),
          actions: const [
            // Padding(
            //   padding: const EdgeInsets.only(right: 16.0),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text(
            //         'Next',
            //         style: Theme.of(context).textTheme.labelSmall,
            //       ),
            //       Row(
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [
            //           GestureDetector(
            //             onTap: widget.onTapNext,
            //             child: Text(
            //               widget.pokemonNext.name,
            //               style: Theme.of(context).textTheme.labelLarge,
            //             ),
            //           ),
            //           const Icon(Icons.arrow_forward_ios_outlined, size: 8),
            //         ],
            //       ),
            //     ],
            //   ),
            // )
          ],
          elevation: 0,
        ),
        body: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            ImageHeaderWidget(
                image: widget.pokemon.urlImage,
                pokemonColor: getColor(widget.pokemon)),
            AtributesWidget(
              pokemonColor: getColor(widget.pokemon),
              abilities: widget.pokemon.abilities,
              name: widget.pokemon.name,
            ),
            StatusWidget(
                classification: widget.pokemon.types
                    .map((e) =>
                        e.name[0].toUpperCase() +
                        e.name.substring(1).toLowerCase())
                    .join(", "),
                abilities:
                    widget.pokemon.abilities.map((e) => e.name).join(', ')),
            PokemonDetailsWidget(
              pokemonHeight: widget.pokemon.height,
              pokemonWeight: widget.pokemon.weight,
              pokemonColor: getColor(widget.pokemon),
            ),
          ],
        ));
  }
}

Color getColor(PokemonEntity pokemon) {
  switch (pokemon.color) {
    case 'green':
      return Colors.green;

    case 'blue':
      return Colors.blue;

    case 'red':
      return Colors.red;

    case 'yellow':
      return Colors.yellow;

    case 'white':
      return Colors.white70;

    case 'brown':
      return Colors.brown;

    case 'purple':
      return Colors.purple;

    case 'black':
      return Colors.black;

    case 'gray':
      return Colors.grey;

    case 'pink':
      return Colors.pink;

    default:
      return Colors.white;
  }
}
