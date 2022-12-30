class AirlineModelResponse {

  int? id;
  String? name;
  String? country;
  String? logo;
  String? slogan;
  String? headQuaters;
  String? website;
  String? established;

  AirlineModelResponse(
    this.id,
    this.name,
    this.country,
    this.established,
    this.headQuaters,
    this.logo,
    this.slogan,
    this.website
  );

  AirlineModelResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    country = json['country'];
    logo = json['logo'];
    slogan = json['slogan'];
    headQuaters = json['head_quaters'];
    website = json['website'];
    established = json['established'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['country'] = country;
    data['logo'] = logo;
    data['slogan'] = slogan;
    data['head_quaters'] = headQuaters;
    data['website'] = website;
    data['established'] = established;
    return data;
  }
}
