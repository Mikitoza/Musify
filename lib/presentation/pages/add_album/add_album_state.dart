import 'package:musify_mobile/data/models/genre.dart';

class AddAlbumState {
  final List<Genre> genres;
  final bool isLoading;
  final int genre;

  AddAlbumState({
    required this.genre,
    required this.isLoading,
    required this.genres,
  });

  AddAlbumState copyWith({
    List<Genre>? genres,
    bool? isLoading,
    int? genre,
  }) {
    return AddAlbumState(
      genres: genres ?? this.genres,
      isLoading: isLoading ?? this.isLoading,
      genre: genre ?? this.genre,
    );
  }
}
