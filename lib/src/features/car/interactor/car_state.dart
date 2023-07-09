import 'car_entity.dart';

sealed class CarState {}

final class CarSuccess implements CarState {
  final List<CarEntity> cars;
  const CarSuccess(this.cars);
}

final class CarLoading implements CarState {}

final class CarFailed implements CarState {
  final String message;
  const CarFailed(this.message);
}
