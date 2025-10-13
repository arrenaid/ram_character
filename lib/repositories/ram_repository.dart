import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:ram_character/models/response_dto.dart';

class RamRepository {
  late final Dio _dio;

  RamRepository() {
    _dio = Dio()
      ..interceptors.addAll([
        PrettyDioLogger(requestHeader: true, requestBody: true),
      ]);
  }

  Future<ResponseDTO> getCharacter({
    String url = 'https://rickandmortyapi.com/api/character'}) async {
    Response response = await _dio.get(url);

    debugPrint(response.toString());
    var dto = ResponseDTO.fromJson(response.data as Map<String, dynamic>);
    debugPrint(dto.info.toString());
    return dto;
  }
}
