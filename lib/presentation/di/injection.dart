import 'package:get_it/get_it.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musify_mobile/data/datasources/local_database_provider.dart';
import 'package:musify_mobile/data/datasources/local_database_source.dart';
import 'package:musify_mobile/data/datasources/preference_data_source.dart';
import 'package:musify_mobile/data/datasources/remote_data_source.dart';
import 'package:musify_mobile/data/repositories/album_repository.dart';
import 'package:musify_mobile/data/repositories/genre_repository.dart';
import 'package:musify_mobile/data/repositories/track_repository.dart';
import 'package:musify_mobile/data/repositories/user_repository.dart';
import 'package:musify_mobile/domain/usecases/create_album_usecase.dart';
import 'package:musify_mobile/domain/usecases/create_track_usecase.dart';
import 'package:musify_mobile/domain/usecases/navigation_usecase.dart';
import 'package:musify_mobile/domain/usecases/home_usecase.dart';
import 'package:musify_mobile/domain/usecases/registration_usercase.dart';
import 'package:musify_mobile/presentation/app/navigation/app_router.gr.dart';
import 'package:musify_mobile/presentation/app/navigation/auth_guard.dart';
import 'package:musify_mobile/presentation/pages/add_album/add_album_cubit.dart';
import 'package:musify_mobile/presentation/pages/add_genre/add_genre_cubit.dart';
import 'package:musify_mobile/presentation/pages/add_track/add_track_cubit.dart';
import 'package:musify_mobile/presentation/pages/delete_album/delete_album_cubit.dart';
import 'package:musify_mobile/presentation/pages/delete_genre/delete_genre_cubit.dart';
import 'package:musify_mobile/presentation/pages/home/home_cubit.dart';
import 'package:musify_mobile/presentation/pages/login/login_cubit.dart';

GetIt get i => GetIt.instance;

void initInjector() {
  initDataSourceModule();
  initRepositoryModule();
  initUsecaseModule();
  initNavigationModule();
  initCubitModule();
  i.registerSingleton<AudioPlayer>(
    AudioPlayer(),
  );
}

void initDataSourceModule() {
  i.registerSingleton<RemoteDataSource>(
    RemoteDataSource(),
  );
  i.registerSingleton<PreferenceDataSource>(
    PreferenceDataSource(),
  );
  i.registerSingleton<LocalDatabaseProvider>(
    LocalDatabaseProvider(),
  );
  i.registerSingleton<LocalDatabaseDataSource>(
    LocalDatabaseDataSource(i.get()),
  );
}

void initRepositoryModule() {
  i.registerSingleton<UserRepository>(
    UserRepository(i.get(), i.get()),
  );
  i.registerSingleton<GenreRepostiory>(
    GenreRepostiory(i.get()),
  );
  i.registerSingleton<AlbumRepository>(
    AlbumRepository(i.get()),
  );
  i.registerSingleton<TrackRepository>(
    TrackRepository(i.get()),
  );
}

void initUsecaseModule() {
  i.registerSingleton<RegistrationUsecase>(
    RegistrationUsecase(i.get()),
  );
  i.registerSingleton<HomeUsecase>(
    HomeUsecase(i.get(), i.get(), i.get()),
  );
  i.registerSingleton<CreateTrackUsecase>(
    CreateTrackUsecase(i.get(), i.get()),
  );
  i.registerSingleton<NavigationUsecase>(
    NavigationUsecase(i.get()),
  );
  i.registerSingleton<CreateAlbumUsecase>(
    CreateAlbumUsecase(i.get(), i.get()),
  );
}

void initNavigationModule() {
  i.registerSingleton<AuthorizationGuard>(
    AuthorizationGuard(i.get()),
  );
  i.registerSingleton<AppRouter>(
    AppRouter(authorizationGuard: i.get()),
  );
}

void initCubitModule() {
  i.registerSingleton<LoginCubit>(
    LoginCubit(i.get()),
  );
  i.registerSingleton<HomeCubit>(
    HomeCubit(i.get()),
  );
  i.registerSingleton<AddAlbumCubit>(
    AddAlbumCubit(
      i.get(),
      i.get(),
    ),
  );
  i.registerSingleton<AddGenreCubit>(
    AddGenreCubit(i.get()),
  );
  i.registerSingleton<DeleteGenreCubit>(
    DeleteGenreCubit(i.get()),
  );
  i.registerSingleton<DeleteAlbumCubit>(
    DeleteAlbumCubit(
      i.get(),
      i.get(),
    ),
  );
  i.registerSingleton<AddTrackCubit>(
    AddTrackCubit(
      i.get(),
      i.get(),
    ),
  );
}
