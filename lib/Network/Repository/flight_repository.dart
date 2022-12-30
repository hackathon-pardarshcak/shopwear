import 'package:flutter/foundation.dart';
import '../../Data/Remote/Response/flight_model_response.dart';
import '../APIs/http_constant.dart';
import '../NetworkHandler/custom_dio.dart';

class FlightRepository{
  static var customDio = CustomDio();
  // ignore: prefer_typing_uninitialized_variables
  static var client;

  static Future<FlightModelResponse> fetchAllFlightData() async{
    try {
      client = await customDio.getDio();
      var response = await client.get(flightUrl);
        return FlightModelResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      return FlightModelResponse.withError('No Internet Connection');
    }
  }
}