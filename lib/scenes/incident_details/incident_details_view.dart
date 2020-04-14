import 'package:app_be_the_hero_madeinflutter/common/components/btnExpandedWithInkwell.dart';
import 'package:app_be_the_hero_madeinflutter/extension/currency_formatter.dart';
import 'package:app_be_the_hero_madeinflutter/extension/custom_color_scheme.dart';
import 'package:app_be_the_hero_madeinflutter/model/incident/IncidentResponse.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class IncidentDetailsWidget extends StatelessWidget {
  IncidentResponse _incidentDetails;

  IncidentDetailsWidget(this._incidentDetails);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.main,
      body: _detailsContainer(context),
    );
  }

  Container _detailsContainer(context) {
    return Container(
      color: Theme.of(context).colorScheme.main,
      padding: EdgeInsets.all(16.0),
      child: _bodyOfContainerDetails(context),
    );
  }

  SingleChildScrollView _bodyOfContainerDetails(context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _headerRowDetails(context),
          SizedBox(
            height: 30,
          ),
          _cardDetails(context),
          SizedBox(
            height: 15,
          ),
          _cardContact(context),
        ],
      ),
    );
  }

  Card _cardContact(context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Theme.of(context).colorScheme.card,
      margin: EdgeInsets.only(right: 3, left: 3),
      child: _bodyOfCardContact(context),
    );
  }

  Container _bodyOfCardContact(context) {
    return Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
      width: MediaQuery.of(context).size.width,
      child: _columnOfBodyCardContact(context),
    );
  }

  Column _columnOfBodyCardContact(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
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
        _buttonsOfBodyCardContract(context),
      ],
    );
  }

  Row _buttonsOfBodyCardContract(context) {
    return Row(
      children: <Widget>[
        BtnExpandedWithInkwellWidget(
            () => _share(context, _incidentDetails), "WhatsApp"),
        SizedBox(
          width: 5,
        ),
        BtnExpandedWithInkwellWidget(
            () => _share(context, _incidentDetails), "Email")
      ],
    );
  }

  Card _cardDetails(context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Theme.of(context).colorScheme.card,
      margin: EdgeInsets.only(right: 3, left: 3),
      child: bodyOfCardDetails(context),
    );
  }

  Container bodyOfCardDetails(context) {
    return Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
      width: MediaQuery.of(context).size.width,
      child: _columnOfBodyCardDetails(context),
    );
  }

  Column _columnOfBodyCardDetails(context) {
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
        Text(_incidentDetails.description),
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

  Row _headerRowDetails(BuildContext context) {
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
        IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Theme.of(context).colorScheme.red,
            size: 32.0,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}

void _share(context, IncidentResponse incident) {
  final RenderBox box = context.findRenderObject();
  final String text = "${incident.name} - ${incident.description}";

  print(text);

  Share.share(text,
      subject: incident.description,
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
}
