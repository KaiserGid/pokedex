import 'package:flutter/material.dart';
import 'package:pokedex/src/shared/colors.dart';

class ImageHeaderWidget extends StatelessWidget {
  const ImageHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/2.png'))),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              CustomColors.background,
              // Color.fromARGB(255, 0, 96, 134),
              Colors.transparent,
            ],
          ),
        ),
      ),
    );
  }
}
