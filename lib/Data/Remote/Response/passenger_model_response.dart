import 'airline_model_response.dart';

class PassengerModelResponse {

  List<AirlineModelResponse>? airlineModelResponse;
  String? id;
  String? name;
  int? trips;
  String? error;

  PassengerModelResponse(this.airlineModelResponse,this.name,this.id,this.trips,);

  PassengerModelResponse.empty();

  PassengerModelResponse.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    trips = json['trips'];
    airlineModelResponse = List.of(json['airline'] != null
        ? (json['airline'] as List)
        .map((i) => AirlineModelResponse.fromJson(i))
        .toList()
        : List<AirlineModelResponse>.empty());
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (airlineModelResponse != null) {
      data['fundingTypes'] = airlineModelResponse?.map((v) => v.toJson()).toList();
    }
    data['_id'] = id;
    data['name'] = name;
    data['trips'] = trips;
    return data;
  }

}