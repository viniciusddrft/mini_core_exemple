import 'package:flutter/material.dart';

import '../data/service_request_web.dart';
import 'car_state.dart';
import 'interfaces/i_service_request_web.dart';

class CarInteractor extends ValueNotifier<CarState> {
  CarInteractor() : super(CarLoading());

  final IServiceRequest repository = ServiceRequestWeb();

  void loadCars() async {
    try {
      value = CarLoading();
      final cars = await repository.getCars();
      value = CarSuccess(cars);
    } catch (e) {
      value = CarFailed(e.toString());
    }
  }
}
