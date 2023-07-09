// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:minicore_exemple/src/features/car/interactor/car_entity.dart';

import '../interactor/interfaces/i_service_request_web.dart';

class ServiceRequestWeb implements IServiceRequest {
  final http.Client client;
  ServiceRequestWeb(this.client);

  @override
  Future<List<CarEntity>> getCars() async {
    final response = await client.get(Uri.parse('https://parallelum.com.br/fipe/api/v1/carros/marcas'));

    final List<CarEntity> cars = [];

    for (final json in jsonDecode(response.body)) {
      cars.add(CarEntity.fromJson(json));
    }

    return cars;
  }
}
