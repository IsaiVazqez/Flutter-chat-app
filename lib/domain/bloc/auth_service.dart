import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:chat/features/usuarios/domain/entities/usuario.dart';
import 'package:chat/domain/repositories/enviroment.dart';
import 'package:chat/features/login/domain/models/login_response.dart';

class AuthService with ChangeNotifier {
  Usuario? usuario;
  Future login(String email, String password) async {
    final data = {'email': email, 'password': password};

    final uri = Uri.parse('${Enviroment.apiUrl}/login');

    final resp = await http.post(uri,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    print(resp.body);
    if (resp.statusCode == 200) {
      final loginResponse = loginresponseFromJson(resp.body);
      this.usuario = loginResponse.usuario;
    }
  }
}
