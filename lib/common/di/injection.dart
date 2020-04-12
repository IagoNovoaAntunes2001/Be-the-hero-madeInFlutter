import 'package:app_be_the_hero_madeinflutter/repository/incident/incident_repository.dart';

class Injector {
  static final Injector singleton = new Injector._internal();

  factory Injector() {
    return singleton;
  }

  Injector._internal();

  IncidentRepository get incidentRepository {
    return new IncidentRepository();
  }
}
