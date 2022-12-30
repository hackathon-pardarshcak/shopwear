import 'geo_model_response.dart';

class AddressModel {

  String? street;
  String? suite;
  String? city;
  String? zipcode;
  GeoModel? geoModel;

  AddressModel({this.street,this.suite,this.city,this.zipcode,this.geoModel});

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
      geoModel: GeoModel.fromJson(json['geo']),
    );
  }
}