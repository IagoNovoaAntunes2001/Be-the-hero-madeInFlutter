import 'package:app_be_the_hero_madeinflutter/extension/custom_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../common/components/containerLogo.dart';

class ErrorWidgetNotResults extends StatelessWidget {
  String path;

  ErrorWidgetNotResults(this.path);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _headerOfColumn(),
        _bodyOfColumn(context),
      ],
    );
  }

  Widget _bodyOfColumn(BuildContext context) {
    return Center(
      child: Column(
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
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Text(
            "Ocorreu um erro Hero! :(",
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.035,
                color: Theme.of(context).colorScheme.black,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Icon(
            Icons.error,
            color: Theme.of(context).colorScheme.grey,
            size: 120,
          ),
        ],
      ),
    );
  }

  Widget _headerOfColumn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        ContainerLogoWidget(path),
        Text(
          "Não há resultados",
          style: TextStyle(fontSize: 16.0, color: Colors.grey[800]),
        ),
      ],
    );
  }
}
