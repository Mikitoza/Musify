import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musify_mobile/data/models/genre.dart';
import 'package:musify_mobile/data/repositories/genre_repository.dart';
import 'package:musify_mobile/presentation/app/navigation/app_router.gr.dart';
import 'package:musify_mobile/presentation/app/navigation/navigation_constants.dart';
import 'package:musify_mobile/presentation/di/injection.dart';
import 'package:musify_mobile/presentation/pages/add_genre/add_genre_state.dart';

import 'delete_genre_state.dart';

class DeleteGenreCubit extends Cubit<DeleteGenreState> {
  final GenreRepostiory _genreRepostiory;
  final appRouter = i.get<AppRouter>();

  DeleteGenreCubit(this._genreRepostiory)
      : super(
          DeleteGenreState(
            genres: [],
            isLoading: true,
            currentGenre: 0,
          ),
        );

  void init() async {
    final genres = (await _genreRepostiory.getGenres()).data;
    emit(state.copyWith(
      genres: genres,
      isLoading: false,
    ));
  }

  void deleteAlbum(int id) async {
    final response = await _genreRepostiory.deleteGenre(id);
    if (response.isSuccess) appRouter.replaceNamed(homePath);
  }

  void setCurrent(int id) {
    emit(state.copyWith(currentGenre: id));
  }
}
