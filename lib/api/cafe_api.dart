import 'package:admin_dashboard/services/local_storage.dart';
import 'package:dio/dio.dart';

class CafeApi {
  static Dio _dio = new Dio();

  //configuramos nuestra instancia de dio
  //para que siempre tenga los headers necesarios
  //en cada peticion que hagamos

  static void configureDio() {
    //url base
    _dio.options.baseUrl = 'http://localhost:8080/api';

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
    } catch (e) {
      print(e);
      throw ('Error in GET request');
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
    } catch (e) {
      print(e);
      throw ('Error in POST request');
    }
  }

  static Future httpPut(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);

    try {
      final resp = await _dio.put(path, data: formData);
      return resp.data;
    } catch (e) {
      print(e);
      throw ('Error in PUT request');
    }
  }

  static Future httpDelete(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);
    try {
      final resp = await _dio.delete(path, data: formData);
      return resp.data;
    } catch (e) {
      print(e);
      throw ('Error in Delete request');
    }
  }
}
