import 'package:app_be_the_hero_madeinflutter/model/incident/IncidentResponse.dart';

abstract class IncidentContract {
  void showIncidents(List<IncidentResponse> incident);

  void showError(String error);

  void showLoading();

  void hideLoading();
}
