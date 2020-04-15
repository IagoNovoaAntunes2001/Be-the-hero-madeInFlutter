import 'package:app_be_the_hero_madeinflutter/common/components/InkwellContainerButton.dart';
import 'package:app_be_the_hero_madeinflutter/common/components/containerLogo.dart';
import 'package:app_be_the_hero_madeinflutter/common/components/loader.dart';
import 'package:app_be_the_hero_madeinflutter/common/components/showData.dart';
import 'package:app_be_the_hero_madeinflutter/extension/custom_color_scheme.dart';
import 'package:app_be_the_hero_madeinflutter/model/incident/IncidentResponse.dart';
import 'package:app_be_the_hero_madeinflutter/scenes/incident/incident_contract.dart';
import 'package:app_be_the_hero_madeinflutter/scenes/incident/incident_presenter.dart';
import 'package:app_be_the_hero_madeinflutter/scenes/incident/introductionWidget.dart';
import 'package:app_be_the_hero_madeinflutter/scenes/incident_details/incident_details_view.dart';
import 'package:flutter/material.dart';

import 'errorWidget.dart';

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
    return _buildIncident(context);
  }

  Widget _buildIncident(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.main,
      body: _incidentsContainer(context),
    );
  }

  Widget _incidentsContainer(BuildContext context) {
    if (this.isLoading) {
      return LoadingWidget();
    } else {
      return incident();
    }
  }

  Widget incident() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: hasErrorVerify(),
    );
  }

  Widget hasErrorVerify() {
    return _verifyHasError();
  }

  Widget _verifyHasError() {
    if (hasError.length > 0) {
      return _errorWidget();
    } else {
      return _incidentsColumn(context);
    }
  }

  Widget _errorWidget() {
    return ErrorWidgetNotResults("lib/assets/images/logo.png");
  }

  Widget _incidentsColumn(BuildContext context) {
    return Column(
      children: <Widget>[
        _headerRowIncidents(context),
        InroductionWidget(),
        _cardIncidents(context),
      ],
    );
  }

  Widget _cardIncidents(BuildContext context) {
    return Expanded(
      child: _listOfCards(),
    );
  }

  Widget _listOfCards() {
    return ListView.builder(
      itemCount: _incidentList.length,
      itemBuilder: (context, index) {
        return _itemCard(context, _incidentList[index]);
      },
    );
  }

  Widget _itemCard(BuildContext context, IncidentResponse incident) {
    return Card(
      child: _containerOfItensCard(context, incident),
    );
  }

  Widget _containerOfItensCard(
      BuildContext context, IncidentResponse incident) {
    return Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
      width: MediaQuery.of(context).size.width,
      child: _bodyOfItemCard(incident),
    );
  }

  Widget _bodyOfItemCard(IncidentResponse incident) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ShowDataWidget(
          incident,
          isMainData: true,
        ),
        _btnShowDetailsItemCard(incident),
      ],
    );
  }

  Widget _headerRowIncidents(BuildContext context) {
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
          builder: (context) => IncidentDetailsWidget(incident),
        ),
      ),
    );
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
