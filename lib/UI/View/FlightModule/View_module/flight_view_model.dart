import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../../Data/Remote/Response/flight_model_response.dart';
import '../../../../Data/Remote/Response/passenger_model_response.dart';
import '../../../../Network/Repository/flight_repository.dart';

class FlightViewModel extends FullLifeCycleController {

  // List<PassengerModelResponse>? flightList = [];
  var flightList = <PassengerModelResponse>[].obs;
  var isLoading = true.obs;
  var onError = false.obs;
  var pageCount = 0.obs;
  var passengerCount = 0.obs;
  ScrollController controller = ScrollController();
  int listLength = 6;

  @override
  void onInit() {
    super.onInit();
    getAllFlight();
  }

  Future<void> getAllFlight() async {
    var flight = await FlightRepository.fetchAllFlightData();
    if (flight != null) {
      isLoading.value = false;
      pageCount.value = flight.totalPages!;
      flightList.value = flight.passengerModelResponse!;
    } else {
      isLoading.value = false;
      onError.value = true;
    }
  }
}