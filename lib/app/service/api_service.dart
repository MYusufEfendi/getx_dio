import 'package:dio/dio.dart';

import 'logging.dart';
import '../data/mode/character_model.dart';
import 'dart:convert';
import 'dart:io';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://rickandmortyapi.com/api/",
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      connectTimeout: 20000,
      receiveTimeout: 10000,
    ),
  )..interceptors.add(Logging());

  Future<CharacterModel?> getData(email, password) async {
    CharacterModel? res;
    try {
      Response response = await _dio.post("character");
      print('response data: ${response.data}');
      res = CharacterModel.fromJson(response.data);
    } on DioError catch (e) {
      print('Error response : $e');
      res = null;
    }
    return res;
  }
}
