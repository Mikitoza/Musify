import 'package:musify_mobile/data/models/genre.dart';

class DeleteGenreState {
  final List<Genre> genres;
  final bool isLoading;
  final int currentGenre;

  DeleteGenreState({
    required this.genres,
    required this.isLoading,
    required this.currentGenre,
  });

  DeleteGenreState copyWith({
    List<Genre>? genres,
    bool? isLoading,
    int? currentGenre,
  }) {
    return DeleteGenreState(
      genres: genres ?? this.genres,
      isLoading: isLoading ?? this.isLoading,
      currentGenre: currentGenre ?? this.currentGenre,
    );
  }
}
