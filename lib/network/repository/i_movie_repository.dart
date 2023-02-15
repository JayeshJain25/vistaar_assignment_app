import 'package:vistaar_assignment_app/model/movie_data.dart';

abstract class IMovieRepository {
  Future<List<MovieData?>> getData();
}
