import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:minicore_exemple/src/features/car/interactor/car_entity.dart';

import '../interactor/interfaces/i_service_request_web.dart';

class ServiceRequestWeb implements IServiceRequest {
  @override
  Future<List<CarEntipy>> getCars() async {
    final response = await http.get(Uri.parse('https://parallelum.com.br/fipe/api/v1/carros/marcas'));

    final List<CarEntipy> cars = [];

    for (final json in jsonDecode(response.body)) {
      cars.add(CarEntipy.fromJson(json));
    }

    return cars;
  }
}
