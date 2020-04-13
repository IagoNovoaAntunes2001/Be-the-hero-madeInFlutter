import 'package:app_be_the_hero_madeinflutter/common/components/InkwellContainerButton.dart';
import 'package:app_be_the_hero_madeinflutter/common/components/loader.dart';
import 'package:app_be_the_hero_madeinflutter/extension/currency_formatter.dart';
import 'package:app_be_the_hero_madeinflutter/extension/custom_color_scheme.dart';
import 'package:app_be_the_hero_madeinflutter/model/incident/IncidentResponse.dart';
import 'package:app_be_the_hero_madeinflutter/scenes/incident/incident_contract.dart';
import 'package:app_be_the_hero_madeinflutter/scenes/incident/incident_presenter.dart';
import 'package:app_be_the_hero_madeinflutter/scenes/incident_details/incident_details_view.dart';
import 'package:flutter/material.dart';

class IncidentWidget extends StatefulWidget {
  @override
  _IncidentWidgetState createState() => _IncidentWidgetState();
}

class _IncidentWidgetState extends State<IncidentWidget>
    implements IncidentContract {
  IncidentPresenter presenter;

  bool isLoading = true;

  List<IncidentResponse> _incidentList = new List<IncidentResponse>();

  _IncidentWidgetState() {
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
      backgroundColor: Theme.of(context).colorScheme.main,
      body: _incidentsContainer(context),
    );
  }

  Widget _incidentsContainer(BuildContext context) {
    if (this.isLoading) {
      return LoadingWidget();
    } else {
      return Container(
        padding: EdgeInsets.all(16.0),
        child: _incidentsColumn(context),
      );
    }
  }

  Column _incidentsColumn(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _headerRowIncidents(context),
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
        _cardIncidents(context),
      ],
    );
  }

  Expanded _cardIncidents(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: _incidentList.length,
          itemBuilder: (context, index) {
            return _itemCard(context, _incidentList[index]);
          }),
    );
  }

  Card _itemCard(BuildContext context, IncidentResponse incident) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
        width: MediaQuery.of(context).size.width,
        child: _bodyOfItemCard(incident),
      ),
    );
  }

  Column _bodyOfItemCard(IncidentResponse incident) {
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
        Text(incident.name),
        SizedBox(
          height: 20,
        ),
        Text(
          "CASO:",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.black),
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
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.black),
        ),
        SizedBox(
          height: 10,
        ),
        Text("${incident.value.toCurrency()}"),
        SizedBox(
          height: 10,
        ),
        _btnShowDetailsItemCard(incident),
      ],
    );
  }

  Row _headerRowIncidents(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
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

  Widget _btnShowDetailsItemCard(IncidentResponse incident) {
    return InkwellWidget(
        "Ver mais detalhes",
        () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => IncidentDetailsWidget(incident))));
  }

  @override
  void showError(String e) {
    setState(() {
      //return Center(child: Text("Error", style: TextStyle(fontSize: 4000.0),));
    });
  }

  @override
  void showIncidents(List<IncidentResponse> incident) {
    setState(() {
      this._incidentList = incident;
      print("Showincidents " + isLoading.toString());
    });
  }

  @override
  void hideLoading() {
    setState(() {
      this.isLoading = false;
      print(isLoading);
    });
  }

  @override
  void showLoading() {
    setState(() {
      this.isLoading = true;
      print(isLoading);
    });
  }
}
