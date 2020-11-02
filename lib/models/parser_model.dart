import 'dart:convert';

class ParseModel {
  ParseModel({
    this.id,
    this.nome,
    this.idade,
    this.imagem,
  });

  final String id;
  final String nome;
  final int idade;
  final String imagem;

  factory ParseModel.fromRawJson(String str) =>
      ParseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ParseModel.fromJson(Map<String, dynamic> json) => ParseModel(
        id: json["id"] == null ? null : json["id"],
        nome: json["nome"] == null ? null : json["nome"],
        idade: json["idade"] == null ? null : json["idade"],
        imagem: json["imagem"] == null ? null : json["imagem"],
      );

//factory ParseModel.fromJson(List<dynamic> json)=>{}

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "nome": nome == null ? null : nome,
        "idade": idade == null ? null : idade,
        "imagem": imagem == null ? null : imagem,
      };

  static List<ParseModel> fromJsonList(List list) {
    if (list == null) return null;
    return list.map<ParseModel>((item) => ParseModel.fromJson(item)).toList();
  }
}
