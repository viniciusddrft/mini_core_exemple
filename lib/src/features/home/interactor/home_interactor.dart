import 'package:flutter/material.dart';
import 'interfaces/i_service_request_web.dart';
import '../data/service_request_web.dart';
import 'home_state.dart';

class HomeInteractor extends ValueNotifier<HomeState> {
  HomeInteractor() : super(HomeLoading());

  final IServiceRequest repository = ServiceRequestWeb();

  void loadCars() async {
    try {
      value = HomeLoading();
      final cars = await repository.getCars();
      value = HomeSuccess(cars);
    } catch (e) {
      value = HomeFailed(e.toString());
    }
  }
}
