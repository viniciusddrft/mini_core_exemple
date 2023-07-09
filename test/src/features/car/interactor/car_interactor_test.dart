import 'package:flutter_test/flutter_test.dart';
import 'package:minicore_exemple/src/features/car/interactor/car_interactor.dart';
import 'package:minicore_exemple/src/features/car/interactor/car_state.dart';
import 'package:minicore_exemple/src/features/car/interactor/interfaces/i_service_request_web.dart';
import 'package:mocktail/mocktail.dart';
import 'package:value_listenable_test/value_listenable_test.dart';

class IServiceRequestMock extends Mock implements IServiceRequest {}

void main() {
  late IServiceRequest service;
  late CarInteractor interactor;
  setUp(() {
    service = IServiceRequestMock();
    interactor = CarInteractor(service);
  });

  valueListenableTest(
    'Process fetch cars with sucess',
    build: () {
      when(() => service.getCars()).thenAnswer((_) async => const CarSuccess([]));
      return interactor;
    },
    act: (interactor) => interactor.loadCars(),
    expect: () => [isA<CarLoading>(), isA<CarSuccess>()],
    verify: (_) => verify(() => service.getCars()),
  );

  valueListenableTest(
    'Process fetch cars with failed',
    build: () {
      when(() => service.getCars()).thenAnswer((_) async => const CarFailed('falha'));
      return interactor;
    },
    act: (interactor) => interactor.loadCars(),
    expect: () => [isA<CarLoading>(), isA<CarFailed>()],
    verify: (_) => verify(() => service.getCars()),
  );
}
