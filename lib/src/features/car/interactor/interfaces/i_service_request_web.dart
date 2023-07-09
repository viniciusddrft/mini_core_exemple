import '../car_state.dart';

abstract interface class IServiceRequest {
  Future<CarState> getCars();
}
