import 'car_entity.dart';

sealed class HomeState {}

final class HomeSuccess implements HomeState {
  final List<CarEntipy> cars;
  const HomeSuccess(this.cars);
}

final class HomeLoading implements HomeState {}

final class HomeFailed implements HomeState {
  final String message;
  const HomeFailed(this.message);
}
