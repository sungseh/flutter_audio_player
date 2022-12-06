import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_just_audio/main.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:rxdart/rxdart.dart'; 

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({super.key});

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  late AudioPlayer _audioPlayer;

  final _playlist = ConcatenatingAudioSource(
    children: [
      AudioSource.uri(
        Uri.parse('https://assets.mixkit.co/music/preview/mixkit-tech-house-vibes-130.mp3'),
        tag: MediaItem(
          id: '0', 
          title: 'Mixkit Sound',
          artist: 'Matser Domain',
          artUri: Uri.parse(
            'https://images.unsplash.com/photo-1433086966358-54859d0ed716'
          )
        )
      ),
      AudioSource.uri(
        Uri.parse('https://assets.mixkit.co/music/preview/mixkit-hazy-after-hours-132.mp3'),
        tag: MediaItem(
          id: '1', 
          title: 'Earth Sound',
          artist: 'Niki',
          artUri: Uri.parse(
            'https://images.unsplash.com/photo-1433086966358-54859d0ed716'
          )
        )
      ),
      AudioSource.uri(
        Uri.parse('https://assets.mixkit.co/music/preview/mixkit-hip-hop-02-738.mp3'),
        tag: MediaItem(
          id: '2', 
          title: 'Air Sound',
          artist: 'Domand',
          artUri: Uri.parse(
            'https://images.unsplash.com/photo-1433086966358-54859d0ed716'
          )
        )
      ),
      AudioSource.uri(
        Uri.parse('https://assets.mixkit.co/music/preview/mixkit-a-very-happy-christmas-897.mp3'),
        tag: MediaItem(
          id: '3', 
          title: 'Time Sound',
          artist: 'Music Domain',
          artUri: Uri.parse(
            'https://images.unsplash.com/photo-1433086966358-54859d0ed716'
          )
        )
      ),
    ]
  );

  Stream<PositionData> get _positionDataStream =>
    // Rx.combineLatest3(streamA, streamB, streamC, (a, b, c) => null)
    Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
      _audioPlayer.positionStream,
      _audioPlayer.bufferedPositionStream,
      _audioPlayer.durationStream,
      (position, bufferedPosition, duration) => PositionData(
        position, 
        bufferedPosition, 
        duration ?? Duration.zero
      )
    );

  @override
  void initState() {
    super.initState();
    // _audioPlayer = AudioPlayer()..setAsset('assets/audio/angels.mp3');
    _audioPlayer = AudioPlayer();
    _init();

    // _audioPlayer.positionStream;
    // _audioPlayer.bufferedPosition;
    // _audioPlayer.durationStream;
  }

  Future<void> _init() async {
    await _audioPlayer.setLoopMode(LoopMode.all);
    await _audioPlayer.setAudioSource(_playlist);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: (){},
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
        ),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.more_horiz)
          )
        ]
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.red,
              Colors.blue
            ]
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<SequenceState?>(
              stream: _audioPlayer.sequenceStateStream,
              builder: (context, snapshot) {
                final state = snapshot.data;
                if(state?.sequence.isEmpty ?? true){
                  return const SizedBox();
                }
                final metadata = state!.currentSource!.tag as MediaItem;

                return MediaMetadata(
                  imageUrl: metadata.artUri.toString(), 
                  artist: metadata.artist ?? "", 
                  title: metadata.title, 
                );
              }
            ),
            const SizedBox(
              height: 20,
            ),
            StreamBuilder<PositionData>(
              stream: _positionDataStream,
              builder: ((context, snapshot) {
                final positionData = snapshot.data;
                return ProgressBar(
                  barHeight: 8,
                  baseBarColor: Colors.grey[600],
                  bufferedBarColor: Colors.grey,
                  progressBarColor: Colors.red,
                  thumbColor: Colors.red,
                  timeLabelTextStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                  ),
                  progress: positionData?.position ?? Duration.zero,
                  buffered: positionData?.bufferedPosition ?? Duration.zero,
                  total: positionData?.duration ?? Duration.zero,
                  onSeek: _audioPlayer.seek,
                );
              }),
            ),
            const SizedBox(
              height: 20,
            ),
            Controls(
              audioPlayer: _audioPlayer
            )
          ],
        ),
      ),
    );
  }
}