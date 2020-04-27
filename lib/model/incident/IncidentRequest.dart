class IncidentRequest {
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

  IncidentRequest(
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
}
