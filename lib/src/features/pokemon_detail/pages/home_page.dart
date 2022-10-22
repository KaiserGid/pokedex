import 'package:flutter/material.dart';
import 'package:pokedex/src/features/home/widgets/name_and%20types_widget.dart';
import 'package:pokedex/src/features/home/widgets/image_header_widget.dart';
import 'package:pokedex/src/features/home/widgets/pokemon_details.dart';
import 'package:pokedex/src/features/home/widgets/classification_status_widget.dart';
import 'package:pokedex/src/shared/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.background,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            'Pokemons',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          centerTitle: false,
          backgroundColor: Colors.transparent,
          leading: const Icon(Icons.arrow_back_ios_new_rounded),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Next'),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text('Picachu'),
                        Icon(Icons.arrow_forward_ios_outlined, size: 8),
                      ]),
                ],
              ),
            )
          ],
          elevation: 0,
        ),
        body: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            const ImageHeaderWidget(),
            const AtributesWidget(),
            const StatusWidget(),
            const PokemonDetails(),
          ],
        ));
  }
}
