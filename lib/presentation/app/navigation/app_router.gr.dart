// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

import '../../../data/models/Track.dart' as _i12;
import '../../pages/add_album/add_album.dart' as _i5;
import '../../pages/add_genre/add_genre.dart' as _i3;
import '../../pages/add_track/add_track.dart' as _i7;
import '../../pages/current_playing/current_track.dart' as _i8;
import '../../pages/delete_album/delete_album.dart' as _i6;
import '../../pages/delete_genre/delete_genre.dart' as _i4;
import '../../pages/home/home_page.dart' as _i2;
import '../../pages/login/login_page.dart' as _i1;
import 'auth_guard.dart' as _i11;

class AppRouter extends _i9.RootStackRouter {
  AppRouter(
      {_i10.GlobalKey<_i10.NavigatorState>? navigatorKey,
      required this.authorizationGuard})
      : super(navigatorKey);

  final _i11.AuthorizationGuard authorizationGuard;

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LoginPage());
    },
    HomeRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomePage());
    },
    AddGenreRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.AddGenrePage());
    },
    DeleteGenre.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.DeleteGenre());
    },
    AddAlbumRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.AddAlbumPage());
    },
    DeleteAlbum.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.DeleteAlbum());
    },
    AddTrackRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.AddTrackPage());
    },
    CurrentSong.name: (routeData) {
      final args = routeData.argsAs<CurrentSongArgs>();
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.CurrentSong(key: args.key, track: args.track));
    }
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig('/#redirect',
            path: '/', redirectTo: '/login', fullMatch: true),
        _i9.RouteConfig(LoginRoute.name, path: '/login'),
        _i9.RouteConfig(HomeRoute.name,
            path: '/home', guards: [authorizationGuard]),
        _i9.RouteConfig(AddGenreRoute.name,
            path: '/addGenre', guards: [authorizationGuard]),
        _i9.RouteConfig(DeleteGenre.name,
            path: '/deleteGenre', guards: [authorizationGuard]),
        _i9.RouteConfig(AddAlbumRoute.name,
            path: '/addAlbum', guards: [authorizationGuard]),
        _i9.RouteConfig(DeleteAlbum.name,
            path: '/deleteAlbum', guards: [authorizationGuard]),
        _i9.RouteConfig(AddTrackRoute.name,
            path: '/addTrack', guards: [authorizationGuard]),
        _i9.RouteConfig(CurrentSong.name,
            path: '/currentSong', guards: [authorizationGuard])
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i9.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.AddGenrePage]
class AddGenreRoute extends _i9.PageRouteInfo<void> {
  const AddGenreRoute() : super(AddGenreRoute.name, path: '/addGenre');

  static const String name = 'AddGenreRoute';
}

/// generated route for
/// [_i4.DeleteGenre]
class DeleteGenre extends _i9.PageRouteInfo<void> {
  const DeleteGenre() : super(DeleteGenre.name, path: '/deleteGenre');

  static const String name = 'DeleteGenre';
}

/// generated route for
/// [_i5.AddAlbumPage]
class AddAlbumRoute extends _i9.PageRouteInfo<void> {
  const AddAlbumRoute() : super(AddAlbumRoute.name, path: '/addAlbum');

  static const String name = 'AddAlbumRoute';
}

/// generated route for
/// [_i6.DeleteAlbum]
class DeleteAlbum extends _i9.PageRouteInfo<void> {
  const DeleteAlbum() : super(DeleteAlbum.name, path: '/deleteAlbum');

  static const String name = 'DeleteAlbum';
}

/// generated route for
/// [_i7.AddTrackPage]
class AddTrackRoute extends _i9.PageRouteInfo<void> {
  const AddTrackRoute() : super(AddTrackRoute.name, path: '/addTrack');

  static const String name = 'AddTrackRoute';
}

/// generated route for
/// [_i8.CurrentSong]
class CurrentSong extends _i9.PageRouteInfo<CurrentSongArgs> {
  CurrentSong({_i10.Key? key, required _i12.Track track})
      : super(CurrentSong.name,
            path: '/currentSong',
            args: CurrentSongArgs(key: key, track: track));

  static const String name = 'CurrentSong';
}

class CurrentSongArgs {
  const CurrentSongArgs({this.key, required this.track});

  final _i10.Key? key;

  final _i12.Track track;

  @override
  String toString() {
    return 'CurrentSongArgs{key: $key, track: $track}';
  }
}
