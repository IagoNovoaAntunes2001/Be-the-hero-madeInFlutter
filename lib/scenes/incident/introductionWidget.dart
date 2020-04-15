import 'package:app_be_the_hero_madeinflutter/extension/custom_color_scheme.dart';
import 'package:flutter/material.dart';

class InroductionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 35,
        ),
        Text(
          "Bem-vindo!",
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.045,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.black),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Escolha um dos casos abaixo e salve o dia.",
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.028,
              color: Theme.of(context).colorScheme.grey),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
      ],
    );
  }
}
