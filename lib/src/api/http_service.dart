import 'package:dio/dio.dart';
import 'package:flutter_crud/src/model/profile.dart';
import 'package:flutter_crud/src/model/list_user_response.dart';

class HttpService {
  ListProfileResponse listProfileResponse;
  Dio _dio;
  Response response;

  final baseUrl = "https://api.10andar.gestaobytes.com";

  HttpService() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
    ));
    initializeInterceptors();
  }

  Future<Response> getHTTP(String url) async {
    try {
      response = await _dio.get(url);
    } on DioError catch (e) {
      print(e.message);
    }
    return response;
  }

  Future<bool> createHTTP(Profile data) async {
    final response = await _dio.post(
      "/api/v1/admin/clients",
      data: profileToJson(data),
      options: Options(headers: {'content-Type': 'application/json'}),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateHTTP(Profile data) async {
    final response = await _dio.put(
      "/api/v1/admin/clients/${data.id}",
      data: profileToJson(data),
      options: Options(headers: {'content-Type': 'application/json'}),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  // Future<bool> updateHTTP(Profile data) async {
  //   response = await _dio.put("$baseUrl/api/v1/admin/clients/${data.id}",
  //       options: Options(
  //         headers: {'Content-Type': 'application/json'},
  //       ));
  //   profileToJson(data);
  //   if (response.statusCode == 200) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  Future<bool> deleteHTTP(int id) async {
    response = await _dio.delete(
      "/api/v1/admin/clients/$id",
      options: Options(headers: {'content-Type': 'application/json'}),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  // Future<bool> deleteProfile(int id) async {
  //   final response = await client.delete(
  //     "$baseUrl/api/v1/admin/clients/$id",
  //     headers: {"content-type": "application/json"},
  //   );
  //   if (response.statusCode == 200) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  // Future<Response> getRequest(String endPoint) async{
  //   Response response;
  //   try {
  //     response = await _dio.get(endPoint);
  //   } on DioError catch (e) {
  //     print(e.message);
  //     throw Exception(e.message);
  //   }
  //   return response;

  // }

  initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(onError: (error) {
      print(error.message);
    }, onRequest: (request) {
      print("${request.method} ${request.path}");
    }, onResponse: (response) {
      print(response.data);
    }));
  }
}
