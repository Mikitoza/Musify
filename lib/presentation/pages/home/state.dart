import 'package:musify_mobile/data/models/Album.dart';
import 'package:musify_mobile/data/models/Track.dart';

class HomeState {
  final bool isLoading;
  final List<Track> songs;
  final List<Album> albums;
  final bool isAdmin;

  HomeState({
    required this.isLoading,
    required this.songs,
    required this.albums,
    required this.isAdmin,
  });
  factory HomeState.initial() {
    return HomeState(
      songs: [],
      albums: [],
      isLoading: true,
      isAdmin: false,
    );
  }

  HomeState copyWith({
    bool? isLoading,
    List<Track>? songs,
    List<Album>? albums,
    bool? isAdmin,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      songs: songs ?? this.songs,
      albums: albums ?? this.albums,
      isAdmin: isAdmin ?? this.isAdmin,
    );
  }
}
