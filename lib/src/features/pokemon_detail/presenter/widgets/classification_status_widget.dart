import 'package:flutter/material.dart';

class StatusWidget extends StatelessWidget {
  final String classification;
  final String abilities;

  const StatusWidget({
    Key? key,
    required this.classification,
    required this.abilities,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 100),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tipo', style: Theme.of(context).textTheme.bodySmall),
                  Text(
                    classification,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Abilidades',
                      style: Theme.of(context).textTheme.bodySmall),
                  Text(abilities),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
