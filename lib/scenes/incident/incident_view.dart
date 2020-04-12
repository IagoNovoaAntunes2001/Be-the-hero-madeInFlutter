import 'package:app_be_the_hero_madeinflutter/model/incident/Incident.dart';
import 'package:app_be_the_hero_madeinflutter/model/incident/IncidentResponse.dart';
import 'package:app_be_the_hero_madeinflutter/scenes/incident/incident_contract.dart';
import 'package:app_be_the_hero_madeinflutter/scenes/incident/incident_presenter.dart';
import 'package:flutter/material.dart';

import 'package:app_be_the_hero_madeinflutter/extension/currency_formatter.dart';

class IncidentWidget extends StatefulWidget {
  @override
  _IncidentWidgetState createState() => _IncidentWidgetState();
}

class _IncidentWidgetState extends State<IncidentWidget>
    implements IncidentContract {
  IncidentPresenter presenter;

  List<IncidentResponse> _incidentList = new List<IncidentResponse>();

  _IncidentWidgetState(){
    this.presenter = new IncidentPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    this.presenter.loadIncidents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: columnOfIncidents(context),
      ),
    );
  }

  Column columnOfIncidents(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        rowOfHeader(context),
        SizedBox(
          height: 35,
        ),
        Text(
          "Bem-vindo!",
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.045,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Escolha um dos casos abaixo e salve o dia.",
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.028,
              color: Colors.grey[600]),
        ),
        SizedBox(height: 40),
        cardOfIncidents(context),
      ],
    );
  }

  Expanded cardOfIncidents(BuildContext context) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.white70,
        margin: EdgeInsets.only(right: 3, left: 3),
        child: ListView.builder(
            itemCount: _incidentList.length,
            itemBuilder: (context, index) {
              return _itemCard(context, _incidentList[index]);
            }),
      ),
    );
  }

  Card _itemCard(BuildContext context, IncidentResponse incident) {
    return Card(
      child: Container(
        padding:
            EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "ONG:",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            Text(incident.name),
            SizedBox(
              height: 20,
            ),
            Text(
              "CASO:",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            Text(incident.title),
            SizedBox(
              height: 10,
            ),
            Text(
              "VALOR:",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            Text("${incident.value.toCurrency()}"),
            SizedBox(
              height: 10,
            ),
            btnShowDetails(),
          ],
        ),
      ),
    );
  }

  Row rowOfHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height * 0.10,
          width: MediaQuery.of(context).size.width * 0.30,
          child: Image.asset(
            'lib/assets/images/logo.png',
            fit: BoxFit.none,
          ),
        ),
        Text(
          "Total de ${_incidentList.length} casos.",
          style: TextStyle(fontSize: 16.0, color: Colors.grey[800]),
        ),
      ],
    );
  }

  InkWell btnShowDetails() {
    return InkWell(
      onTap: () => null,
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Ver mais detalhes",
              style: TextStyle(color: Colors.red[600], fontSize: 16),
            ),
            Icon(
              Icons.navigate_next,
              color: Colors.red[600],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void showError() {
    // TODO: implement showError
  }

  @override
  void showIncidents(List<IncidentResponse> incident) {
    setState(() {
      this._incidentList = incident;
    });
  }
}
