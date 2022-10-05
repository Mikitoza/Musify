import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:musify_mobile/data/models/Track.dart';
import 'package:musify_mobile/presentation/pages/current_playing/current_track.dart';

import '../../data/models/Album.dart';
import 'loading.dart';

class HorizontalSongList extends StatelessWidget {
  final List<Track> tracks;

  HorizontalSongList({
    Key? key,
    required this.tracks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 10),
          ...tracks
              .map(
                (song) => InkWell(
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => CurrentSong(track: song))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: CachedNetworkImage(
                              imageUrl:
                                  'http://192.168.43.232:8083/StaticAlbums/${song.albumId}/image.png',
                              width: 150,
                              height: 150,
                              progressIndicatorBuilder: (context, url, l) =>
                                  const LoadingImage(size: 80),
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 7),
                          Text(
                            song.name,
                            maxLines: 2,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList()
        ],
      ),
    );
  }
}

class HorizontalAlbumList extends StatelessWidget {
  final List<Album> albums;

  HorizontalAlbumList({
    Key? key,
    required this.albums,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 10),
          ...albums
              .map(
                (album) => InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: CachedNetworkImage(
                              imageUrl: 'http://192.168.43.232:8083/StaticAlbums/${album.albumId}/image.png',
                              width: 150,
                              height: 150,
                              progressIndicatorBuilder: (context, url, l) =>
                                  const LoadingImage(size: 80),
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 7),
                          Text(
                            album.name,
                            maxLines: 2,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList()
        ],
      ),
    );
  }
}
