import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/UI/View/FlightModule/View/flight_screen.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import '../../../../Utils/common_function.dart';
import '../../../../Utils/no_data_found.dart';
import '../../../../Utils/string_constants.dart';
import '../../../CustomWidgets/custom_loading.dart';
import '../../../CustomWidgets/custom_text.dart';
import '../View_module/flight_view_model.dart';
import 'flight_detail_screen.dart';

class FlightView extends StatefulWidget {
  const FlightView({Key? key}) : super(key: key);

  @override
  State<FlightView> createState() => _FlightViewState();
}

class _FlightViewState extends State<FlightView> with WidgetsBindingObserver {
  final flightViewModel = Get.find<FlightViewModel>();


  void loadMoreData() {

  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: flightListing(flightViewModel));
  }

  Widget flightListing(FlightViewModel flightViewModel) {
    return Scaffold(
        appBar: AppBar(
          title: customText(advanceTitle),
          centerTitle: true,
        ),
        body: Obx(() => flightViewModel.onError.isTrue
            ? const NoDataFound()
            : flightViewModel.isLoading.value == true
                ? customLoading()
                : LazyLoadScrollView(
                  onEndOfPage: () {

                  },
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: flightViewModel.flightList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Get.to(FlightDetail(),
                              arguments: flightViewModel.flightList[index].airlineModelResponse?[0].logo,),
                          child: Card(
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: SizedBox(
                                        width: 100,
                                        height: 100,
                                        child: Hero(
                                          tag: 'Airline Images',
                                          child: imageLoad(flightViewModel
                                              .flightList[index]
                                              .airlineModelResponse?[0]
                                              .logo),
                                        )),
                                    title: customText(
                                        '$userEmail ${flightViewModel.flightList[index].airlineModelResponse?[0].name}'),
                                    subtitle: customText(
                                        '$userName ${flightViewModel.flightList[index].name}'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                      ),
                )
        )
    );
  }
}
