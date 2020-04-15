import 'package:app_be_the_hero_madeinflutter/common/components/btnExpandedWithInkwell.dart';
import 'package:app_be_the_hero_madeinflutter/common/components/containerLogo.dart';
import 'package:app_be_the_hero_madeinflutter/scenes/incident_details/introductionDetails.dart';
import 'package:app_be_the_hero_madeinflutter/common/components/showData.dart';
import 'package:app_be_the_hero_madeinflutter/extension/custom_color_scheme.dart';
import 'package:app_be_the_hero_madeinflutter/model/incident/IncidentResponse.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class IncidentDetailsWidget extends StatelessWidget {
  IncidentResponse _incidentDetails;

  IncidentDetailsWidget(this._incidentDetails);

  @override
  Widget build(BuildContext context) {
    return _buildIncidentDetails(context);
  }

  Widget _buildIncidentDetails(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.main,
      body: _detailsContainer(context),
    );
  }

  Widget _detailsContainer(context) {
    return Container(
      color: Theme.of(context).colorScheme.main,
      padding: EdgeInsets.all(16.0),
      child: _bodyOfContainerDetails(context),
    );
  }

  Widget _bodyOfContainerDetails(context) {
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

  Widget _cardContact(context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Theme.of(context).colorScheme.card,
      margin: EdgeInsets.only(right: 3, left: 3),
      child: _bodyOfCardContact(context),
    );
  }

  Widget _bodyOfCardContact(context) {
    return Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
      width: MediaQuery.of(context).size.width,
      child: _columnOfBodyCardContact(context),
    );
  }

  Widget _columnOfBodyCardContact(context) {
    return _dataOfBody(context);
  }

  Widget _dataOfBody(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        IntroductionWidget(),
        buttonsOfBodyCardContact(context),
      ],
    );
  }

  Widget buttonsOfBodyCardContact(context) {
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

  Widget _cardDetails(context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Theme.of(context).colorScheme.card,
      margin: EdgeInsets.only(right: 3, left: 3),
      child: bodyOfCardDetails(context),
    );
  }

  Widget bodyOfCardDetails(context) {
    return Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
      width: MediaQuery.of(context).size.width,
      child: _columnOfBodyCardDetails(context),
    );
  }

  Widget _columnOfBodyCardDetails(context) {
    return ShowDataWidget(_incidentDetails);
  }

  Widget _headerRowDetails(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _containerOfHeaderRowDetails(context, 'lib/assets/images/logo.png'),
        _iconButtonHeaderRowDetails(context),
      ],
    );
  }

  Widget _iconButtonHeaderRowDetails(context) {
    return IconButton(
      icon: Icon(
        Icons.chevron_left,
        color: Theme.of(context).colorScheme.red,
        size: 32.0,
      ),
      onPressed: () => Navigator.pop(context),
    );
  }

  Widget _containerOfHeaderRowDetails(context, path) {
    return ContainerLogoWidget(path);
  }
}

void _share(context, IncidentResponse incident) {
  final RenderBox box = context.findRenderObject();
  final String text = "${incident.name} - ${incident.description}";

  Share.share(text,
      subject: incident.description,
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
}
