import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:minicore_exemple/src/features/car/data/service_request_web.dart';
import 'package:minicore_exemple/src/features/car/interactor/car_state.dart';
import 'package:mocktail/mocktail.dart';

class ClientMock extends Mock implements Client {}

class ResponseMock extends Mock implements Response {}

void main() {
  late Client client;
  late ServiceRequestWeb service;
  setUp(() {
    client = ClientMock();
    service = ServiceRequestWeb(client);
  });

  setUpAll(() {
    registerFallbackValue(Uri.parse(''));
  });

  test('deverá retornar um estado de sucesso ao completar corretamente', () async {
    final response = ResponseMock();
    when(() => response.body).thenReturn(jsonString);
    when(() => client.get(any())).thenAnswer((_) async => response);

    final result = await service.getCars();
    expect(result, isA<CarSuccess>());
  });

  test('deverá retornar um estado de falha ao completar incorretamente', () async {
    when(() => client.get(any())).thenThrow(Exception());

    final result = await service.getCars();
    expect(result, isA<CarFailed>());
  });
}

const jsonString = ''' 
[{"codigo":"1","nome":"Acura"},{"codigo":"2","nome":"Agrale"}]
''';
