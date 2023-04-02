import 'package:dio/dio.dart';
import 'package:test_task_unsplash_client/photo.dart';

class PhotosRepository {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://api.unsplash.com',
    headers: {
      'Authorization': 'Client-ID YOUR_ACCESS_KEY_HERE'
    }, // add your own Unsplash API access key
  ));

  Future<List<Photo>> getPhotos(
      {int page = 1, int perPage = 20, String query = ''}) async {
    try {
      final response = await _dio.get('/photos', queryParameters: {
        'page': page,
        'per_page': perPage,
        'query': query,
      });
      final List<dynamic> data = response.data;
      return data.map((json) => Photo.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
