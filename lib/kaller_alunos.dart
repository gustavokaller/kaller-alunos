import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kaller_alunos/models/aluno.dart';

class KallerAlunos with ChangeNotifier {
  String? _message;
  String? _token;
  String? get token => _token;
  String? get message => _message;

  Future<List<Aluno>> getAllAlunos() async {
    final uri = Uri.parse('http://apis.kaller.com.br/v1/app/getalunos');

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);

        final alunos = responseData
            .map((jsonItem) => Aluno.fromJson(jsonItem))
            .toList();

        _message = null;
        notifyListeners();

        return alunos;
      } else {
        final errorData = json.decode(response.body);
        _message = errorData['message'] ?? 'Erro desconhecido';
        notifyListeners();
        return [];
      }
    } catch (e) {
      _message = 'Erro na conexão: $e';
      notifyListeners();
      return [];
    }
  }
}
