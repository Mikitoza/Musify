import 'package:musify_mobile/data/datasources/remote_data_source.dart';
import 'package:musify_mobile/data/models/genre.dart';
import 'package:musify_mobile/data/utils/wrapper.dart';

class GenreRepostiory{
  final RemoteDataSource _remoteDataSource;

  GenreRepostiory(this._remoteDataSource);

  Future<Wrapper<String>> createGenre(Genre genre) async {
    return await _remoteDataSource.createGenre(genre);
  }

  Future<Wrapper<String>> deleteGenre(int id) async {
    return await _remoteDataSource.deleteGenre(id);
  }

  Future<Wrapper<List<Genre>>> getGenres() async {
    return await _remoteDataSource.getGenres();
  }
}