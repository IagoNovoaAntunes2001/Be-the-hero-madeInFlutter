import 'package:app_be_the_hero_madeinflutter/model/incident/Incident.dart';

class IncidentResponse {
  int id;
  String title;
  String description;
  int value;
  String ongId;
  String name;
  String email;
  String whatsapp;
  String city;
  String uf;
  List<Incident> lista;


  IncidentResponse(
      {this.id,
        this.title,
        this.description,
        this.value,
        this.ongId,
        this.name,
        this.email,
        this.whatsapp,
        this.city,
        this.uf});

  IncidentResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    value = json['value'];
    ongId = json['ong_id'];
    name = json['name'];
    email = json['email'];
    whatsapp = json['whatsapp'];
    city = json['city'];
    uf = json['uf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['value'] = this.value;
    data['ong_id'] = this.ongId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['whatsapp'] = this.whatsapp;
    data['city'] = this.city;
    data['uf'] = this.uf;
    return data;
  }

  @override
  String toString() {
    return 'IncidentResponse{id: $id, title: $title, description: $description, value: $value, ongId: $ongId, name: $name, email: $email, whatsapp: $whatsapp, city: $city, uf: $uf, lista: $lista}';
  }


}