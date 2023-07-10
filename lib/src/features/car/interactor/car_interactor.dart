import 'package:flutter/material.dart';

import 'car_state.dart';
import 'interfaces/i_service_request_web.dart';

class CarInteractor extends ValueNotifier<CarState> {
  CarInteractor(this.serviceRequest) : super(CarLoading());

  final IServiceRequest serviceRequest;

  void loadCars() async {
    value = CarLoading();
    final newState = await serviceRequest.getCars();
    value = newState;
  }
}
