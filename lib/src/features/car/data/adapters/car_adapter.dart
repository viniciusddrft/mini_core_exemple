import 'package:minicore_exemple/src/features/car/interactor/car_entity.dart';

class CarAdapter {
  static CarEntity fromJson(Map<String, dynamic> json) {
    return CarEntity(
      code: json['codigo'],
      name: json['nome'],
    );
  }
}
