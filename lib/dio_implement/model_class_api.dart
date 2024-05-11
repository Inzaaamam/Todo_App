import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  ApiService() {
    _dio.interceptors.add(DioInterceptors());
  }

  Future<List<Map<String, dynamic>>> fetchData(
      {int page = 1, int pageSize = 10}) async {
    try {
      final response = await _dio.get(
        'https://jsonplaceholder.typicode.com/posts',
        queryParameters: {'_page': page, '_limit': pageSize},
      );

      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.data;
        final List<Map<String, dynamic>> data = responseData.map((item) {
          return {
            'id': item['id'],
            'title': item['title'],
            'body': item['body'],
          };
        }).toList();
        return data;
      } else {
        throw Exception(
            'Failed to load data with status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}

class DioInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] =
        'https://jsonplaceholder.typicode.com/posts';
    // print('Sending request to ${options.uri}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('Received response from ${response.requestOptions.uri}');
    handler.next(response);
  }

  @override
  void onError(err, ErrorInterceptorHandler handler) {
    // print(
    //     'Error occurred during request to ${err.requestOptions.uri}: ${err.message}');
    handler.next(err);
  }
}


