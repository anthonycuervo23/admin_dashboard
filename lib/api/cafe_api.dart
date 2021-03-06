import 'dart:typed_data';
import 'package:dio/dio.dart';

//My imports
import 'package:admin_dashboard/services/local_storage.dart';

class CafeApi {
  static Dio _dio = new Dio();

  //configuramos nuestra instancia de dio
  //para que siempre tenga los headers necesarios
  //en cada peticion que hagamos

  static void configureDio() {
    //url base

    //development url
    //_dio.options.baseUrl = 'http://localhost:8080/api';

    //production url
    _dio.options.baseUrl = 'https://admin-web-flutter.herokuapp.com/api';

    //headers configuration
    _dio.options.headers = {
      'x-token': LocalStorage.prefs.getString('token') ?? ''
    };
  }

  //hacemos la configuracion para hacer peticiones http

  //GET
  static Future httpGet(String path) async {
    try {
      final resp = await _dio.get(path);

      return resp.data;
    } on DioError catch (e) {
      print(e);
      throw ('Error in GET request ===> ${e.response?.data['errors'][0]['msg'] ?? '${e.response}'}');
    }
  }

  //POST
  static Future httpPost(String path, Map<String, dynamic> data) async {
    //tenemos que serializar la data que vamos a enviar
    //dio ya tiene una funcion para hacerlo mas facil:
    final formData = FormData.fromMap(data);

    try {
      final resp = await _dio.post(path, data: formData);

      return resp.data;
    } on DioError catch (e) {
      print(e);
      throw ('Error in POST request ===> ${e.response?.data['errors'][0]['msg'] ?? '${e.response}'}');
    }
  }

  static Future httpPut(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);

    try {
      final resp = await _dio.put(path, data: formData);
      return resp.data;
    } on DioError catch (e) {
      print(e);
      throw ('Error in PUT request ===> ${e.response?.data['errors'][0]['msg'] ?? '${e.response}'}');
    }
  }

  static Future httpDelete(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);
    try {
      final resp = await _dio.delete(path, data: formData);
      return resp.data;
    } on DioError catch (e) {
      print(e);
      throw ('Error in Delete request ===>  ${e.response?.data['errors'][0]['msg'] ?? '${e.response}'}');
    }
  }

  static Future httpUploadFile(String path, Uint8List bytes) async {
    final formData =
        FormData.fromMap({'archivo': MultipartFile.fromBytes(bytes)});

    try {
      final resp = await _dio.put(path, data: formData);
      return resp.data;
    } on DioError catch (e) {
      print(e);
      throw ('Error in PUT request ===> ${e.response?.data['errors'][0]['msg'] ?? '${e.response}'}');
    }
  }
}
