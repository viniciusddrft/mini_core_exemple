import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minicore_exemple/src/features/car/interactor/car_interactor.dart';
import 'package:minicore_exemple/src/features/car/interactor/car_state.dart';
import 'package:minicore_exemple/src/features/car/interactor/interfaces/i_service_request_web.dart';
import 'package:minicore_exemple/src/features/car/ui/car_page.dart';
import 'package:minicore_exemple/src/features/car/ui/car_provider.dart';

class CarInteractorMock extends ValueNotifier<CarState> implements CarInteractor {
  CarInteractorMock() : super(CarLoading());

  @override
  void loadCars() {}

  @override
  IServiceRequest get repository => throw UnimplementedError();
}

void main() {
  testWidgets('Update states', (tester) async {
    final interactor = CarInteractorMock();
    await tester.pumpWidget(
      CarProvider(
        carInteractor: interactor,
        child: const MaterialApp(
          home: CarPage(),
        ),
      ),
    );

    expect(find.byKey(const Key('CarLoadingState')), findsOneWidget);
    expect(find.byKey(const Key('CarFailedState')), findsNothing);
    expect(find.byKey(const Key('CarSuccessState')), findsNothing);

    interactor.value = const CarSuccess([]);
    await tester.pump();
    expect(find.byKey(const Key('CarSuccessState')), findsOneWidget);
    expect(find.byKey(const Key('CarLoadingState')), findsNothing);
    expect(find.byKey(const Key('CarFailedState')), findsNothing);

    interactor.value = const CarFailed('falha');
    await tester.pump();
    expect(find.byKey(const Key('CarFailedState')), findsOneWidget);
    expect(find.text('falha'), findsOneWidget);
    expect(find.byKey(const Key('CarSuccessState')), findsNothing);
    expect(find.byKey(const Key('CarLoadingState')), findsNothing);
  });
}
