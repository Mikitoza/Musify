import 'dart:io';

import 'package:musify_mobile/data/models/Album.dart';
import 'package:musify_mobile/data/models/user.dart';
import 'package:musify_mobile/data/repositories/album_repository.dart';
import 'package:musify_mobile/data/repositories/user_repository.dart';

class CreateAlbumUsecase {
  final UserRepository _userRepository;
  final AlbumRepository albumRepository;

  CreateAlbumUsecase(
    this._userRepository,
    this.albumRepository,
  );

  Future<User> getUser() async {
    final username = (await _userRepository.getLogin()).data;
    final users = (await _userRepository.getUsers()).data;
    return users!.firstWhere((element) => element.login == username);
  }

  Future<String> createAlbum(Album album,File file) async {
    final response = await albumRepository.createAlbum(album, file);
    return response.data ?? response.errorMessage ?? "Error";
  }
}
