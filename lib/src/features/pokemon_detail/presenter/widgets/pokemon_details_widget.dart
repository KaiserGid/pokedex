import 'package:flutter/material.dart';

class PokemonDetailsWidget extends StatelessWidget {
  final double pokemonHeight;
  final double pokemonWeight;
  final Color pokemonColor;

  const PokemonDetailsWidget({
    Key? key,
    required this.pokemonHeight,
    required this.pokemonWeight,
    required this.pokemonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 32, left: 16, right: 16, bottom: 16),
      height: MediaQuery.of(context).size.height * 0.20,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        color: pokemonColor.withBlue(120),
      ),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Details', style: Theme.of(context).textTheme.titleSmall),
            Text('Moves', style: Theme.of(context).textTheme.titleSmall),
            Text('Stats', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(width: 64),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Height', style: Theme.of(context).textTheme.labelSmall),
                Text('$pokemonHeight',
                    style: Theme.of(context).textTheme.titleSmall),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('weight', style: Theme.of(context).textTheme.labelSmall),
                Text('$pokemonWeight',
                    style: Theme.of(context).textTheme.titleSmall),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('gender', style: Theme.of(context).textTheme.labelSmall),
                const Icon(Icons.female),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
