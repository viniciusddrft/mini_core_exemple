class CarEntity {
  final String name, code;

  CarEntity.fromJson(Map<String, dynamic> json)
      : code = json['codigo'],
        name = json['nome'];
}
