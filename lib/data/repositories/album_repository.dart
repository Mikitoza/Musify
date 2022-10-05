import 'dart:io';

import 'package:musify_mobile/data/datasources/remote_data_source.dart';
import 'package:musify_mobile/data/models/Album.dart';
import 'package:musify_mobile/data/utils/wrapper.dart';

class AlbumRepository{
  final RemoteDataSource _remoteDataSource;

  AlbumRepository(this._remoteDataSource);

  Future<Wrapper<String>> createAlbum(Album album,File file) async {
    return await _remoteDataSource.createAlbum(album,file);
  }

  Future<Wrapper<List<Album>>> getAlbums() async {
    return await _remoteDataSource.getAlbums();
  }

  Future<Wrapper<String>> deleteAlbum(int id) async {
    return await _remoteDataSource.deleteAlbum(id);
  }
}