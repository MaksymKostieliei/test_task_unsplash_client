import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_unsplash_client/photo.dart';
import 'package:test_task_unsplash_client/photos_repository.dart';

class PhotosBloc extends Cubit<List<Photo>> {
  final PhotosRepository _repository;

  PhotosBloc(this._repository) : super([]);

  Future<void> fetchPhotos(
      {int page = 1, int perPage = 20, String query = ''}) async {
    emit(state +
        await _repository.getPhotos(
            page: page, perPage: perPage, query: query));
  }

  Future<void> refreshPhotos({int perPage = 20, String query = ''}) async {
    emit(await _repository.getPhotos(perPage: perPage, query: query));
  }
}
