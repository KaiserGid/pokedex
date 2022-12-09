import 'package:flutter/material.dart';
import 'package:pokedex/src/features/pokemon_detail/domain/entities/values_objects/pokemon_abilities_value_object.dart';
import 'package:pokedex/src/shared/colors.dart';

class AtributesWidget extends StatelessWidget {
  final String name;
  final List<AbilityEntity> abilities;
  final Color pokemonColor;

  const AtributesWidget({
    Key? key,
    required this.abilities,
    required this.name,
    required this.pokemonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          child: Row(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(name.toUpperCase(),
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8.0),
                SizedBox(
                  height: 30,
                  child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 10),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: abilities.length,
                      itemBuilder: ((context, index) => ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: pokemonColor),
                            child: Text(abilities[index].name,
                                style: const TextStyle(
                                    color: CustomColors.textButton)),
                          ))),
                )
              ],
            ),
          ]),
        ));
  }
}
