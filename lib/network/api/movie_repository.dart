import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vistaar_assignment_app/model/movie_data.dart';
import 'package:vistaar_assignment_app/network/repository/i_movie_repository.dart';

import '../../provider/dio_provider.dart';
import '../../utils/exceptions.dart';

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  return MovieRepository(ref: ref);
});

class MovieRepository implements IMovieRepository {
  MovieRepository({required this.ref});

  final Ref ref;

  @override
  Future<List<MovieData?>> getData() async {
    try {
      List<MovieData> movieList = [];

      final dio = ref.read(dioProvider);
      final response = await dio.get('flutter-json/');
      if (response.data.length == 0) {
        return movieList;
      } else {
        final body = json.decode(response.data);

        for (var i in body) {
          movieList.add(MovieData.fromJson(i));
        }

        return movieList;
      }
    } on DioError catch (error) {
      throw DataException.fromDioError(error);
    }
  }
}
