import 'package:flutter/material.dart';

import '../interactor/car_entity.dart';
import '../interactor/car_state.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final homeInteractor = HomeInteractor();

  @override
  void initState() {
    homeInteractor.loadCars();
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
        valueListenable: homeInteractor,
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
      floatingActionButton: FloatingActionButton(onPressed: homeInteractor.loadCars),
    );
  }
}
