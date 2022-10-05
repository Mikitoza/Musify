import 'dart:io';

import 'package:musify_mobile/data/datasources/remote_data_source.dart';
import 'package:musify_mobile/data/models/Album.dart';
import 'package:musify_mobile/data/models/Track.dart';
import 'package:musify_mobile/data/utils/wrapper.dart';

class TrackRepository{
  final RemoteDataSource _remoteDataSource;

  TrackRepository(this._remoteDataSource);

  Future<Wrapper<String>> createTrack(Track track,File file) async {
    return await _remoteDataSource.createTrack(track,file);
  }

  Future<Wrapper<List<Track>>> getTracks() async {
    return await _remoteDataSource.getTracks();
  }

  Future<Wrapper<String>> deleteTrack(int id) async {
    return await _remoteDataSource.deleteTrack(id);
  }
}