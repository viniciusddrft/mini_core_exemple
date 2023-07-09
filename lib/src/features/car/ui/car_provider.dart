import 'package:flutter/widgets.dart';
import 'package:minicore_exemple/src/features/car/interactor/car_interactor.dart';

class CarProvider extends InheritedNotifier<CarInteractor> {
  const CarProvider({
    super.key,
    required super.child,
    required CarInteractor carInteractor,
  }) : super(notifier: carInteractor);

  static CarInteractor of(BuildContext context, {bool listen = true}) {
    if (listen) {
      return context.dependOnInheritedWidgetOfExactType<CarProvider>()!.notifier!;
    }
    return context.getInheritedWidgetOfExactType<CarProvider>()!.notifier!;
  }
}
