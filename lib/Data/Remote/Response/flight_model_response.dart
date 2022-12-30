import 'package:getxdemo/Data/Remote/Response/passenger_model_response.dart';

class FlightModelResponse {

  List<PassengerModelResponse>? passengerModelResponse;
  int? totalPassengers;
  int? totalPages;
  String? error;

  FlightModelResponse(this.passengerModelResponse, this.totalPages, this.totalPassengers);

  FlightModelResponse.fromJson(Map<String, dynamic> json) {

    passengerModelResponse = List.of(json['data'] != null
        ? (json['data'] as List)
        .map((i) => PassengerModelResponse.fromJson(i))
        .toList()
        : List<PassengerModelResponse>.empty());

    totalPassengers = json['totalPassengers'];
    totalPages = json['totalPages'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (passengerModelResponse != null) {
      data['data'] = passengerModelResponse?.map((v) => v.toJson()).toList();
    }

    data['totalPassengers'] = totalPassengers;
    data['totalPages'] = totalPages;
    return data;
  }
  FlightModelResponse.withError(String errorMessage) {
    error = errorMessage;
  }
}