import '../car_entity.dart';

abstract interface class IServiceRequest {
  Future<List<CarEntipy>> getCars();
}
