import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:musify_mobile/data/models/Track.dart';
import 'package:sqflite/sqflite.dart';

import 'local_database_provider.dart';

class LocalDatabaseDataSource {
  final LocalDatabaseProvider _databaseProvider;

  LocalDatabaseDataSource(this._databaseProvider);

  Future<Database> get db => _databaseProvider.database;

  Future<Track?> deleteRecord(int id) async {
    final track = getTrackById(id);
    (await db).delete(
      'tracks',
      where: 'id = ?',
      whereArgs: [id],
    );
    return track;
  }

  Future<List<Track>> getAllTracks() async {
    return (await (await db).query('tracks')).map((map) => Track.fromMap(map)).toList();
  }

  Future<Track?> getTrackById(int id) async {
    final recordMap =
        (await (await db).query('track', where: 'id = ?', whereArgs: [id], limit: 1)).first;
    return recordMap["track"] as Track;
  }
}
