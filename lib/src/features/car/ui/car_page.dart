import 'package:flutter/material.dart';

import '../data/service_request_web.dart';
import '../interactor/car_entity.dart';
import '../interactor/car_interactor.dart';
import '../interactor/car_state.dart';

class CarPage extends StatefulWidget {
  const CarPage({super.key});
  @override
  State<CarPage> createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> {
  final carInteractor = CarInteractor(ServiceRequestWeb());

  @override
  void initState() {
    carInteractor.loadCars();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home Page'),
      ),
      body: ValueListenableBuilder(
        valueListenable: carInteractor,
        builder: (context, value, child) => switch (value) {
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
      ),
      floatingActionButton: FloatingActionButton(onPressed: carInteractor.loadCars),
    );
  }
}
