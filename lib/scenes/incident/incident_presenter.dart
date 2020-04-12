import 'package:app_be_the_hero_madeinflutter/common/di/injection.dart';
import 'package:app_be_the_hero_madeinflutter/model/incident/IncidentResponse.dart';
import 'package:app_be_the_hero_madeinflutter/repository/incident/incident_repository.dart';
import 'package:app_be_the_hero_madeinflutter/scenes/incident/incident_contract.dart';

class IncidentPresenter {
  IncidentContract _view;

  IncidentRepository _incidentRepository;

  IncidentPresenter(this._view) {
    _incidentRepository = Injector().incidentRepository;
  }

  loadIncidents(){
    _incidentRepository.searchAll().then((o) {
      _view.showIncidents(o);
    }).catchError((e) => print(e.toString()));
  }

}
