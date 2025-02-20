import 'package:dio/dio.dart';
import '../../constants/endpoints_strings.dart';
import '../../errors/exceptions.dart';
import 'api_consumer.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndpointsStrings.baseUrl;
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true,
    ));
  }

  @override
  Future get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            'Accept': 'application/json',
           // 'Content-Type': 'application/vnd.api+json',
           // 'Authorization': 'Bearer $token',
          },
        ),
      );
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool isFormData = false,
  }) async {
    try {

      final requestData = isFormData
          ? (data is Map<String, dynamic> ? FormData.fromMap(data) : data)
          : data;

      final response = await dio.post(
        path,
        data: requestData,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            'Accept': 'application/json',
          //  'Content-Type': 'application/vnd.api+json',
          //  'Authorization': 'Bearer $token',
          //  if (headers != null) ...headers,
          },
        ),
      );

      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future patch(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.patch(
        path,
        data:
            isFormData ? FormData.fromMap(data as Map<String, dynamic>) : data,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            'Accept': 'application/json',
            //'Content-Type': 'application/vnd.api+json',
            //'Authorization': 'Bearer $token',
          },
        ),
      );
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future<dynamic> put(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      bool isFormData = false}) async {
    final response = await dio.put(
      path,
      data: isFormData ? FormData.fromMap(data as Map<String, dynamic>) : data,
      queryParameters: queryParameters,
      options: Options(
        headers: {
            'Accept': 'application/json',
         // 'Content-Type': 'application/vnd.api+json',
         // 'Authorization': 'Bearer $token',
        },
      ),
    );
    return response.data;
  }

  @override
  Future delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.delete(
        path,
        data:
            isFormData ? FormData.fromMap(data as Map<String, dynamic>) : data,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            'Accept': 'application/json',
          //  'Content-Type': 'application/vnd.api+json',
//'Authorization': 'Bearer $token',
          },
        ),
      );
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }
}
