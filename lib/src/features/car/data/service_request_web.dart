import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:minicore_exemple/src/features/car/interactor/car_entity.dart';
import 'package:minicore_exemple/src/features/car/interactor/car_state.dart';

import '../interactor/interfaces/i_service_request_web.dart';
import 'adapters/car_adapter.dart';

class ServiceRequestWeb implements IServiceRequest {
  final http.Client client;
  ServiceRequestWeb(this.client);

  @override
  Future<CarState> getCars() async {
    try {
      final response = await client.get(
          Uri.parse('https://parallelum.com.br/fipe/api/v1/carros/marcas'));

      final List<CarEntity> cars = [];

      for (final json in jsonDecode(response.body)) {
        cars.add(CarAdapter.fromJson(json));
      }

      return CarSuccess(cars);
    } catch (e) {
      return CarFailed(e.toString());
    }
  }
}
