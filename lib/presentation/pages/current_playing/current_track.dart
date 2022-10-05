import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter/material.dart';
import 'package:musify_mobile/data/models/Track.dart';
import 'package:musify_mobile/presentation/widgets/loading.dart';

import '../../di/injection.dart';

class CurrentSong extends StatefulWidget {
  final Track track;
  const CurrentSong({
    Key? key,
    required this.track,
  }) : super(key: key);

  @override
  State<CurrentSong> createState() => _CurrentSongState();
}

class _CurrentSongState extends State<CurrentSong> {
  late AudioPlayer audioPlayer;
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> setAudio() async{
    String url = 'https://192.168.43.232:8083/StaticAlbums/${widget.track.albumId}/tracks/${widget.track.name}.mp3';
    await audioPlayer.setUrl(url);
  }

  @override
  void initState() {
    audioPlayer = i.get<AudioPlayer>();
    super.initState();

    setAudio();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  imageUrl:
                      'http://192.168.43.232:8083/StaticAlbums/${widget.track.albumId}/image.png',
                  width: double.infinity,
                  height: 250,
                  progressIndicatorBuilder: (context, url, l) => const LoadingImage(size: 80),
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                widget.track.name,
                style: Theme.of(context).textTheme.headline4,
              ),
              Slider(
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                onChanged: (value) async {
                  final position = Duration(seconds: value.toInt());

                  await audioPlayer.seek(position);

                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(formatTime(position),style: Theme.of(context).textTheme.headline4,),
                    Text(formatTime(duration - position),style: Theme.of(context).textTheme.headline4,),
                  ],
                ),
              ),
              CircleAvatar(
                radius: 35,
                child: IconButton(
                  icon: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                  ),
                  iconSize: 50,
                  onPressed: () async {
                    if (isPlaying) {
                      setState(() {
                        isPlaying = !isPlaying;
                      });
                      await audioPlayer.pause();
                    } else {
                      setState(() {
                        isPlaying = !isPlaying;
                      });
                      await audioPlayer.play();
                    }
                  },
                ),
              )
            ],
          ),
        ),
      );

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }
}
