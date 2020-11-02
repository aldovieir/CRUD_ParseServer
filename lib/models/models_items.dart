import 'dart:convert';

import 'package:parse_server_sdk/parse_server_sdk.dart';

class ModeloItems extends ParseObject {
  ModeloItems({
    this.id,
    this.nome,
    this.idade,
    this.imagem,
  }) : super.clone('');

  final String id;
  final String nome;
  final int idade;
  final String imagem;

  factory ModeloItems.fromRawJson(String str) =>
      ModeloItems.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModeloItems.fromJson(Map<String, dynamic> json) => ModeloItems(
        id: json["id"] == null ? null : json["id"],
        nome: json["nome"] == null ? null : json["nome"],
        idade: json["idade"] == null ? null : json["idade"],
        imagem: json["imagem"] == null ? null : json["imagem"],
      );

  static List<ModeloItems> fromJsonList(List list) {
    if (list == null) return null;
    return list.map<ModeloItems>((item) => ModeloItems.fromJson(item)).toList();
  }
}
