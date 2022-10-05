import 'dart:io';

import 'package:musify_mobile/data/models/Album.dart';
import 'package:musify_mobile/data/models/Track.dart';
import 'package:musify_mobile/data/models/user.dart';
import 'package:musify_mobile/data/repositories/track_repository.dart';
import 'package:musify_mobile/data/repositories/user_repository.dart';

class CreateTrackUsecase {
  final UserRepository _userRepository;
  final TrackRepository trackRepository;

  CreateTrackUsecase(
    this._userRepository,
    this.trackRepository,
  );

  Future<User> getUser() async {
    final username = (await _userRepository.getLogin()).data;
    final users = (await _userRepository.getUsers()).data;
    return users!.firstWhere((element) => element.login == username);
  }

  Future<String> createTrack(Track track, File file) async {
    final response = await trackRepository.createTrack(track, file);
    return response.data ?? response.errorMessage ?? "Error";
  }
}
