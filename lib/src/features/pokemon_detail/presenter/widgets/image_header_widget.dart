import 'package:flutter/material.dart';

class ImageHeaderWidget extends StatelessWidget {
  final String image;
  final Color pokemonColor;

  const ImageHeaderWidget({
    Key? key,
    required this.image,
    required this.pokemonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      decoration:
          BoxDecoration(image: DecorationImage(image: NetworkImage(image))),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              pokemonColor,
              // Color.fromARGB(255, 0, 96, 134),
              Colors.transparent,
            ],
          ),
        ),
      ),
    );
  }
}
