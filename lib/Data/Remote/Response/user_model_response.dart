import 'address_model_response.dart';
import 'company_model_response.dart';

class UserModel {

  int? id;
  String? name;
  String? username;
  String? email;
  AddressModel? addressModel;
  CompanyModel? companyModel;

  UserModel({this.id,this.name,this.email,this.username,this.addressModel,this.companyModel});

factory UserModel.fromJson(Map<String, dynamic> json) {
  return UserModel(
    id: json['id'],
    name: json['name'],
    username: json['username'],
    email: json['email'],
    addressModel: AddressModel.fromJson(json['address']),
    companyModel: CompanyModel.fromJson(json['company']),
  );
}

}