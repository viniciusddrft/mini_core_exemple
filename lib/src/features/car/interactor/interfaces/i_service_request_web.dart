import '../car_entity.dart';

abstract interface class IServiceRequest {
  Future<List<CarEntity>> getCars();
}
