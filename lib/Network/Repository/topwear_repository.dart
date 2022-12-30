import 'package:flutter/foundation.dart';
import '../../Data/Remote/Response/allproducts_model_response.dart';
import '../../Data/Remote/Response/topwear_model_response.dart';
import '../APIs/http_constant.dart';
import '../NetworkHandler/custom_dio.dart';

class TopWearProductsRepository{
  static var customDio = CustomDio();
  // ignore: prefer_typing_uninitialized_variables
  static var client;

  static Future<List<TopWearModel>?> fetchAllData() async{
    try {
      client = await customDio.getDio();
      var response = await client.get(baseUrl+topWear);
      // var response = await client.get(ngrokUrl);
      if(response.statusCode == 200) {
        var convertedData = response.data;
        return (convertedData as List).map((e) => TopWearModel.fromJson(e)).toList();
      } else {
        return List<TopWearModel>.empty();
      }
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      return null;
    }
  }
}