import 'package:app_be_the_hero_madeinflutter/extension/custom_color_scheme.dart';
import 'package:flutter/material.dart';

class IntroductionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Salve o dia!",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.black,
              fontSize: 24),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Seja o herói desse caso.",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.black,
              fontSize: 24),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Entre em contato: ",
          style: TextStyle(
              color: Theme.of(context).colorScheme.grey, fontSize: 18),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
