import 'package:flutter/material.dart';
import 'package:pokedex/src/shared/colors.dart';

class AtributesWidget extends StatelessWidget {
  const AtributesWidget({
    Key? key,
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
                Text('Bubasaur', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(
                  height: 8.0,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text('Grass',
                      style: TextStyle(color: CustomColors.textButton)),
                )
              ],
            ),
          ]),
        ));
  }
}
