import 'package:musify_mobile/data/models/Album.dart';

class DeleteAlbumState {
  final List<Album> albums;
  final bool isLoading;
  final int currentGenre;

  DeleteAlbumState({
    required this.albums,
    required this.isLoading,
    required this.currentGenre,
  });

  DeleteAlbumState copyWith({
    List<Album>? albums,
    bool? isLoading,
    int? currentGenre,
  }) {
    return DeleteAlbumState(
      albums: albums ?? this.albums,
      isLoading: isLoading ?? this.isLoading,
      currentGenre: currentGenre ?? this.currentGenre,
    );
  }
}
