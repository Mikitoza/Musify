import 'package:musify_mobile/data/models/Album.dart';
import 'package:musify_mobile/data/models/genre.dart';

class AddTrackState {
  final List<Album> albums;
  final bool isLoading;
  final int album;

  AddTrackState({
    required this.albums,
    required this.isLoading,
    required this.album,
  });

  AddTrackState copyWith({
    List<Album>? albums,
    bool? isLoading,
    int? album,
  }) {
    return AddTrackState(
      albums: albums ?? this.albums,
      isLoading: isLoading ?? this.isLoading,
      album: album ?? this.album,
    );
  }
}
