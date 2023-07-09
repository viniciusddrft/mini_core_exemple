import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:minicore_exemple/src/features/car/data/service_request_web.dart';
import 'package:minicore_exemple/src/features/car/ui/car_provider.dart';

import 'src/features/car/interactor/car_interactor.dart';
import 'src/features/car/ui/car_page.dart';

void main() {
  runApp(
    CarProvider(
      carInteractor: CarInteractor(ServiceRequestWeb(Client())),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MiniCore',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CarPage(),
    );
  }
}
