import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musify_mobile/domain/usecases/home_usecase.dart';
import 'package:musify_mobile/presentation/app/navigation/app_router.gr.dart';
import 'package:musify_mobile/presentation/di/injection.dart';
import 'package:musify_mobile/presentation/pages/home/state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeUsecase _homeUsecase;
  final appRouter = i.get<AppRouter>();

  HomeCubit(this._homeUsecase) : super(HomeState.initial());

  void init() async {
    final tracks = await _homeUsecase.getTracks();
    print(tracks.length);
    final albums = await _homeUsecase.getAlbums();
    print(albums.length);
    final user = await _homeUsecase.getUser();
    emit(
      state.copyWith(
        isAdmin: user.userRole != 0,
        isLoading: false,
        albums: albums,
        songs: tracks,
      ),
    );
  }
}
