import 'package:flutter/material.dart';

import '../interactor/car_entity.dart';
import '../interactor/car_state.dart';
import 'car_provider.dart';

class CarPage extends StatefulWidget {
  const CarPage({super.key});
  @override
  State<CarPage> createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      CarProvider.of(context, listen: false).loadCars();
    });
  }

  @override
  Widget build(BuildContext context) {
    final carInteractor = CarProvider.of(context);
    final value = carInteractor.value;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home Page'),
      ),
      body: switch (value) {
        CarFailed(message: String message) => Center(
            child: Text(message),
          ),
        CarLoading() => const Center(
            child: CircularProgressIndicator(),
          ),
        CarSuccess(cars: List<CarEntity> cars) => ListView.builder(
            itemCount: cars.length,
            itemBuilder: (context, index) => Text(cars[index].name),
          ),
      },
      floatingActionButton: FloatingActionButton(onPressed: carInteractor.loadCars),
    );
  }
}
