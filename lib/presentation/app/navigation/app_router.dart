import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:musify_mobile/data/models/Track.dart';
import 'package:musify_mobile/presentation/app/navigation/auth_guard.dart';
import 'package:musify_mobile/presentation/app/navigation/navigation_constants.dart';
import 'package:musify_mobile/presentation/pages/add_album/add_album.dart';
import 'package:musify_mobile/presentation/pages/add_genre/add_genre.dart';
import 'package:musify_mobile/presentation/pages/add_track/add_track.dart';
import 'package:musify_mobile/presentation/pages/current_playing/current_track.dart';
import 'package:musify_mobile/presentation/pages/delete_album/delete_album.dart';
import 'package:musify_mobile/presentation/pages/delete_genre/delete_genre.dart';
import 'package:musify_mobile/presentation/pages/home/home_page.dart';
import 'package:musify_mobile/presentation/pages/login/login_page.dart';

class CurrentSongRoute extends PageRouteInfo {
  CurrentSongRoute({
    required Track track,
  }) : super(name, path: '/currentSong');
  static const String name = 'currentSong';
}

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: loginPath, page: LoginPage, initial: true),
    AutoRoute(
      path: homePath,
      page: HomePage,
      guards: [AuthorizationGuard],
    ),
    AutoRoute(
      path: addGenrePath,
      page: AddGenrePage,
      guards: [AuthorizationGuard],
    ),
    AutoRoute(
      path: deleteGenrePath,
      page: DeleteGenre,
      guards: [AuthorizationGuard],
    ),
    AutoRoute(
      path: addAlbumPath,
      page: AddAlbumPage,
      guards: [AuthorizationGuard],
    ),
    AutoRoute(
      path: deleteAlbumPath,
      page: DeleteAlbum,
      guards: [AuthorizationGuard],
    ),
    AutoRoute(
      path: addTrackPath,
      page: AddTrackPage,
      guards: [AuthorizationGuard],
    ),
    AutoRoute(
      path: currentSongPath,
      page: CurrentSong,
      guards: [AuthorizationGuard],
    ),
  ],
)
class $AppRouter {}
