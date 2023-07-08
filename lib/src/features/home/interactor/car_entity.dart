class CarEntipy {
  final String name, code;

  CarEntipy.fromJson(Map<String, dynamic> json)
      : code = json['codigo'],
        name = json['nome'];
}
