import 'dart:convert';
import 'package:minicore_exemple/src/features/home/interactor/car_entity.dart';
import 'package:minicore_exemple/src/features/home/interactor/interfaces/i_service_web.dart';
import 'package:http/http.dart' as http;

class ServiceRequestWeb implements IServiceRequest {
  @override
  Future<List<CarEntipy>> getCars() async {
    final response = await http
        .get(Uri.parse('https://parallelum.com.br/fipe/api/v1/carros/marcas'));

    final List<CarEntipy> cars = [];

    for (final json in jsonDecode(response.body)) {
      cars.add(CarEntipy.fromJson(json));
    }

    return cars;
  }
}
