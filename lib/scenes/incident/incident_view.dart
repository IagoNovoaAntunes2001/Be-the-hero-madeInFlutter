import 'package:app_be_the_hero_madeinflutter/common/components/InkwellContainerButton.dart';
import 'package:app_be_the_hero_madeinflutter/common/components/containerLogo.dart';
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
  String hasError = "";

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
        child: hasErrorVerify(),
      );
    }
  }

  Widget hasErrorVerify() {
    if (hasError.length > 0) {
      return _errorWidget();
    } else {
      return _incidentsColumn(context);
    }
  }

  Column _errorWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ContainerLogoWidget("lib/assets/images/logo.png"),
            Text(
              "Não há resultados",
              style: TextStyle(fontSize: 16.0, color: Colors.grey[800]),
            ),
          ],
        ),
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
        Center(
          child: Column(
            children: <Widget>[
              Text(
                "Ocorreu um erro Hero! :(",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.035,
                    color: Theme.of(context).colorScheme.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30,),
              Icon(
                Icons.error,
                color: Theme.of(context).colorScheme.grey,
                size: 120,
              ),
            ],
          ),
        ),
      ],
    );
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
        ContainerLogoWidget("lib/assets/images/logo.png"),
        Text(
          "Total de ${_incidentList.length > 1 ? "${_incidentList.length} casos" : "${_incidentList.length} caso"}",
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
      this.hasError = e;
    });
  }

  @override
  void showIncidents(List<IncidentResponse> incident) {
    setState(() {
      this._incidentList = incident;
    });
  }

  @override
  void hideLoading() {
    setState(() {
      this.isLoading = false;
    });
  }

  @override
  void showLoading() {
    setState(() {
      this.isLoading = true;
    });
  }
}
