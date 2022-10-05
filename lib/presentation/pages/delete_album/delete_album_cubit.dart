import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musify_mobile/data/repositories/album_repository.dart';
import 'package:musify_mobile/domain/usecases/create_album_usecase.dart';
import 'package:musify_mobile/presentation/app/navigation/app_router.gr.dart';
import 'package:musify_mobile/presentation/app/navigation/navigation_constants.dart';
import 'package:musify_mobile/presentation/di/injection.dart';

import 'delete_album_state.dart';

class DeleteAlbumCubit extends Cubit<DeleteAlbumState> {
  final AlbumRepository _albumRepostiory;
  final CreateAlbumUsecase _createAlbumUsecase;

  final appRouter = i.get<AppRouter>();

  DeleteAlbumCubit(this._albumRepostiory, this._createAlbumUsecase)
      : super(
          DeleteAlbumState(
            albums: [],
            isLoading: true,
            currentGenre: 0,
          ),
        );

  void init() async {
    final user = await _createAlbumUsecase.getUser();
    final albums = (await _albumRepostiory.getAlbums()).data;
    emit(state.copyWith(
      albums: albums?.where((e) => e.userId == user.userId).toList() ?? [],
      isLoading: false,
    ));
  }

  void deleteAlbum(int id) async {
    final response = await _albumRepostiory.deleteAlbum(id);
    if (response.isSuccess) appRouter.replaceNamed(homePath);
  }

  void setCurrent(int id) {
    emit(state.copyWith(currentGenre: id));
  }
}
