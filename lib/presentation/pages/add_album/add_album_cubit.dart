import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musify_mobile/data/models/Album.dart';
import 'package:musify_mobile/data/repositories/genre_repository.dart';
import 'package:musify_mobile/domain/usecases/create_album_usecase.dart';
import 'package:musify_mobile/presentation/app/navigation/app_router.gr.dart';
import 'package:musify_mobile/presentation/app/navigation/navigation_constants.dart';
import 'package:musify_mobile/presentation/di/injection.dart';
import 'package:musify_mobile/presentation/pages/add_album/add_album_state.dart';

class AddAlbumCubit extends Cubit<AddAlbumState> {
  final GenreRepostiory _genreRepostiory;
  final CreateAlbumUsecase _createAlbumUsecase;
  final appRouter = i.get<AppRouter>();

  AddAlbumCubit(
    this._genreRepostiory,
    this._createAlbumUsecase,
  ) : super(
          AddAlbumState(
            isLoading: true,
            genre: 0,
            genres: [],
          ),
        );

  void init() async {
    final genres = (await _genreRepostiory.getGenres()).data;
    emit(state.copyWith(
      genres: genres,
      isLoading: false,
    ));
  }

  void setCurrent(int id) {
    emit(state.copyWith(genre: id));
  }

  void createAlbum(int genreId, String name, File file) async {

    await _createAlbumUsecase.createAlbum(
      Album(
        albumId: 0,
        genreId: genreId,
        userId: (await _createAlbumUsecase.getUser()).userId,
        name: name,
      ),
      file,
    );
    appRouter.replaceNamed(homePath);
  }
}
