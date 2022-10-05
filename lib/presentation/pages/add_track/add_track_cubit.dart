import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musify_mobile/data/models/Album.dart';
import 'package:musify_mobile/data/models/Track.dart';
import 'package:musify_mobile/data/repositories/album_repository.dart';
import 'package:musify_mobile/domain/usecases/create_track_usecase.dart';
import 'package:musify_mobile/presentation/app/navigation/app_router.gr.dart';
import 'package:musify_mobile/presentation/app/navigation/navigation_constants.dart';
import 'package:musify_mobile/presentation/di/injection.dart';
import 'package:musify_mobile/presentation/pages/add_track/add_track_state.dart';

class AddTrackCubit extends Cubit<AddTrackState> {
  final AlbumRepository _albumRepository;
  final CreateTrackUsecase _createTrackUsecase;
  final appRouter = i.get<AppRouter>();

  AddTrackCubit(
    this._albumRepository,
    this._createTrackUsecase,
  ) : super(
    AddTrackState(
            isLoading: true,
            album: 0,
            albums: [],
          ),
        );

  void init() async {
    final albums = (await _albumRepository.getAlbums()).data;
    emit(state.copyWith(
      albums: albums,
      isLoading: false,
    ));
  }

  void setCurrent(int id) {
    emit(state.copyWith(album: id));
  }

  void createTrack(int albumId, String name, File file) async {

    final albums = (await _albumRepository.getAlbums()).data;
    final album = albums?.singleWhere((element) => element.albumId == albumId);

    await _createTrackUsecase.createTrack(
      Track(
        id: 0,
        albumId: albumId,
        genreId: album!.genreId,
        userId: (await _createTrackUsecase.getUser()).userId,
        name: name,
      ),
      file,
    );
    appRouter.replaceNamed(homePath);
  }
}
