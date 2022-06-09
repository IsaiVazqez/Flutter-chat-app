// To parse this JSON data, do
//
//     final loginresponse = loginresponseFromJson(jsonString);

import 'dart:convert';

import 'package:chat/features/usuarios/domain/entities/usuario.dart';

Loginresponse loginresponseFromJson(String str) =>
    Loginresponse.fromJson(json.decode(str));

String loginresponseToJson(Loginresponse data) => json.encode(data.toJson());

class Loginresponse {
  Loginresponse({
    required this.ok,
    required this.usuario,
    required this.token,
  });

  bool ok;
  Usuario usuario;
  String token;

  factory Loginresponse.fromJson(Map<String, dynamic> json) => Loginresponse(
        ok: json["ok"],
        usuario: Usuario.fromJson(json["usuario"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "usuario": usuario.toJson(),
        "token": token,
      };
}
