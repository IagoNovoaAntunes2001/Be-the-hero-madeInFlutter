import 'package:app_be_the_hero_madeinflutter/model/incident/IncidentResponse.dart';
import 'package:app_be_the_hero_madeinflutter/repository/Repository.dart';
import 'package:app_be_the_hero_madeinflutter/repository/incident/incident_repository_contract.dart';

class IncidentRepository extends Repository implements IncidentRepositoryContract {
  @override
  Future<List<IncidentResponse>> searchAll() async {
    var request = await this.get("/incidents") as List<dynamic>;
    var map = request.map((l) => IncidentResponse.fromJson(l)).toList();
    return map;
  }
}