import 'package:musify_mobile/data/models/Album.dart';
import 'package:musify_mobile/data/models/Track.dart';
import 'package:musify_mobile/data/models/user.dart';
import 'package:musify_mobile/data/repositories/album_repository.dart';
import 'package:musify_mobile/data/repositories/track_repository.dart';
import 'package:musify_mobile/data/repositories/user_repository.dart';

class HomeUsecase {
  final UserRepository _userRepository;
  final AlbumRepository _albumRepository;
  final TrackRepository _trackRepository;

  HomeUsecase(
    this._userRepository,
    this._albumRepository,
    this._trackRepository,
  );

  Future<User> getUser() async {
    final username = (await _userRepository.getLogin()).data;
    final users = (await _userRepository.getUsers()).data;
    return users!.firstWhere((element) => element.login == username);
  }

  Future<List<Album>> getAlbums() async {
    final albums = (await _albumRepository.getAlbums()).data;
    return albums!;
  }

  Future<List<Track>> getTracks() async {
    final tracks = (await _trackRepository.getTracks()).data;
    return tracks!;
  }
}
