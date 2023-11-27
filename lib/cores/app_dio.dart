//if i wanna make dio singleton

import 'package:dio/dio.dart';
import 'package:e_commerce_app/cores/app_endpoints.dart';
import 'package:e_commerce_app/singleton/shared_preferences.dart';

class AppDio {

  static late Dio _dio;

  static void init() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: Endpoints.baseUrl,
      headers: {
        'Content-Type': 'application/json',
        'lang': PreferenceUtils.getString(PrefKeys.language),
        'Authorization': PreferenceUtils.getString(PrefKeys.apiToken)

      }
    );
    _dio = Dio(baseOptions);
  }

  static Future<Response<dynamic>> get({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
  }) async{
    return _dio.get(
       endpoint,
      queryParameters: queryParameters,
      options: Options(
        headers: {
          'lang': PreferenceUtils.getString(PrefKeys.language),
          'Authorization': PreferenceUtils.getString(PrefKeys.apiToken)
        }
      )
    );
  }

  static Future<Response<dynamic>> post({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,

  }) async{
    return _dio.post(
        endpoint,
        queryParameters: queryParameters,
        data: body,
        options: Options(
            headers: {
              'lang': PreferenceUtils.getString(PrefKeys.language),
              'Authorization': PreferenceUtils.getString(PrefKeys.apiToken)
            }
        )
    );
  }

  static Future<Response<dynamic>> put({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,

  }) async{
    return _dio.put(
        endpoint,
        queryParameters: queryParameters,
        data: body,
        options: Options(
            headers: {
              'lang': PreferenceUtils.getString(PrefKeys.language),
              'Authorization': PreferenceUtils.getString(PrefKeys.apiToken)
            }
        )
    );
  }

  static Future<Response<dynamic>> delete({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,

  }) async{
    return _dio.delete(
        endpoint,
        queryParameters: queryParameters,
        data: body,
        options: Options(
            headers: {
              'lang': PreferenceUtils.getString(PrefKeys.language),
              'Authorization': PreferenceUtils.getString(PrefKeys.apiToken)
            }
        )
    );
  }
}



