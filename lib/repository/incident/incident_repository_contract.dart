import 'package:app_be_the_hero_madeinflutter/model/incident/IncidentResponse.dart';

abstract class IncidentRepositoryContract {
  Future<List<IncidentResponse>> searchAll();
}
