import 'package:app_be_the_hero_madeinflutter/model/incident/IncidentResponse.dart';
import 'package:flutter/material.dart';
import 'package:app_be_the_hero_madeinflutter/extension/currency_formatter.dart';
import 'package:app_be_the_hero_madeinflutter/extension/custom_color_scheme.dart';

class ShowDataWidget extends StatelessWidget {
  IncidentResponse _incidentDetails;

  bool isMainData = false;

  ShowDataWidget(this._incidentDetails, {@required this.isMainData});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "ONG:",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.black),
        ),
        SizedBox(
          height: 10,
        ),
        Text(_incidentDetails.name),
        SizedBox(
          height: 20,
        ),
        Text(
          "CASO: ",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.black),
        ),
        SizedBox(
          height: 10,
        ),
        Text(isMainData == true
            ? _incidentDetails.title
            : _incidentDetails.description),
        SizedBox(
          height: 10,
        ),
        Text(
          "VALOR:",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.black),
        ),
        SizedBox(
          height: 10,
        ),
        Text("${_incidentDetails.value.toCurrency()}"),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
