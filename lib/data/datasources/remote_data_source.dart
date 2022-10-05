import 'dart:io';

import 'package:dio/dio.dart';
import 'package:musify_mobile/data/models/Album.dart';
import 'package:musify_mobile/data/models/Track.dart';
import 'package:musify_mobile/data/models/user.dart';
import 'package:musify_mobile/data/models/genre.dart';
import 'package:musify_mobile/data/utils/wrapper.dart';

class RemoteDataSource {
  final _dio = Dio();
  final _baseUrl = 'http://192.168.43.232:8083';

  set token(String? token) => _dio.options.headers = {'Authorization': "bearer $token"};

  Future<Wrapper<User>> register(User user) async {
    final response = await _dio.post(
      _baseUrl + '/api/Auth/register',
      data: user.toJson(),
    );
    User newUser = User.fromJson(response.data);
    return Wrapper<User>(
      data: newUser,
      status: response.statusCode ?? 500,
      errorMessage: response.statusMessage,
    );
  }

  Future<Wrapper<String>> login(User user) async {
    final response = await _dio.post(
      _baseUrl + '/api/Auth/login',
      data: user.toJson(),
    );
    return Wrapper(
      data: response.data.isNotEmpty ? response.data : null,
      status: response.statusCode ?? 500,
      errorMessage: response.statusMessage,
    );
  }

  Future<Wrapper<String>> getLogin() async {
    final response = await _dio.get(
      _baseUrl + '/api/Auth',
    );
    return Wrapper(
      data: response.data.isNotEmpty ? response.data : null,
      status: response.statusCode ?? 500,
      errorMessage: response.statusMessage,
    );
  }

  Future<Wrapper<List<User>>> getUsers() async {
    final response = await _dio.get(
      _baseUrl + '/api/User',
    );
    List<User> users = (response.data as List).map((e) => User.fromJson(e)).toList();
    return Wrapper<List<User>>(
      data: users,
      status: response.statusCode ?? 500,
      errorMessage: response.statusMessage,
    );
  }

  Future<Wrapper<String>> createAlbum(Album album, File file) async {
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(file.path, filename: fileName),
      "UserId": album.userId,
      "GenreId": album.genreId,
      "AlbumId": album.albumId,
      "Name": album.name,
    });
    final response = await _dio.post(_baseUrl + '/api/Albums', data: formData);
    return Wrapper<String>(
      data: response.data,
      status: response.statusCode ?? 500,
      errorMessage: response.statusMessage,
    );
  }

  Future<Wrapper<List<Album>>> getAlbums() async {
    final response = await _dio.get(
      _baseUrl + '/api/Albums',
    );
    List<Album> albums = (response.data["result"] as List).map((e) => Album.fromJson(e)).toList();
    return Wrapper<List<Album>>(
      data: albums,
      status: response.statusCode ?? 500,
      errorMessage: response.statusMessage,
    );
  }

  Future<Wrapper<String>> deleteAlbum(int id) async {
    final response = await _dio.delete(
      _baseUrl + '/api/Albums/$id',
      data: {"id": id},
    );
    return Wrapper<String>(
      data: response.data,
      status: response.statusCode ?? 500,
      errorMessage: response.statusMessage,
    );
  }

  Future<Wrapper<String>> createGenre(Genre genre) async {
    final response = await _dio.post(
      _baseUrl + '/api/Genres',
      data: genre.toJson(),
    );
    return Wrapper<String>(
      data: response.data,
      status: response.statusCode ?? 500,
      errorMessage: response.statusMessage,
    );
  }

  Future<Wrapper<String>> deleteGenre(int id) async {
    final response = await _dio.delete(
      _baseUrl + '/api/Genres/$id',
      data: {"id": id},
    );
    return Wrapper<String>(
      data: response.data,
      status: response.statusCode ?? 500,
      errorMessage: response.statusMessage,
    );
  }

  Future<Wrapper<List<Genre>>> getGenres() async {
    final response = await _dio.get(
      _baseUrl + '/api/Genres',
    );
    List<Genre> genres = (response.data as List).map((e) => Genre.fromJson(e)).toList();
    return Wrapper<List<Genre>>(
      data: genres,
      status: response.statusCode ?? 500,
      errorMessage: response.statusMessage,
    );
  }

  Future<Wrapper<String>> createTrack(Track track, File file) async {
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(file.path, filename: fileName),
      "UserId": track.userId,
      "GenreId": track.genreId,
      "AlbumId": track.albumId,
      "Name": track.name,
      "Id": track.id,
    });
    final response = await _dio.post(_baseUrl + '/api/Tracks', data: formData);
    return Wrapper<String>(
      data: response.data,
      status: response.statusCode ?? 500,
      errorMessage: response.statusMessage,
    );
  }

  Future<Wrapper<List<Track>>> getTracks() async {
    final response = await _dio.get(
      _baseUrl + '/api/Tracks',
    );
    List<Track> tracks = (response.data["result"] as List).map((e) => Track.fromJson(e)).toList();
    return Wrapper<List<Track>>(
      data: tracks,
      status: response.statusCode ?? 500,
      errorMessage: response.statusMessage,
    );
  }

  Future<Wrapper<String>> deleteTrack(int id) async {
    final response = await _dio.delete(
      _baseUrl + '/api/Tracks/$id',
      data: {"id": id},
    );
    return Wrapper<String>(
      data: response.data,
      status: response.statusCode ?? 500,
      errorMessage: response.statusMessage,
    );
  }
}
