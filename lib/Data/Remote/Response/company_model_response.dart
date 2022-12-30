
class CompanyModel {

  String? name;
  String? catchPhrase;
  String? bs;

  CompanyModel({this.name,this.catchPhrase,this.bs});

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
        name: json['name'],
        catchPhrase: json['catchPhrase'],
        bs: json['bs'],
    );
  }

}