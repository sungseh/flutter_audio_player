import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:just_audio/just_audio.dart';

part 'audio_player_event.dart';
part 'audio_player_state.dart';
   
class AudioPlayerBloc extends Bloc<AudioPlayerEvent, AudioPlayerState> {
  AudioPlayerBloc() : super(AudioPlayerInitial(audio: AudioPlayer())) {
    on<PlayAudio>(_onPlayAudio);
    on<PauseAudio>(_onPauseAudio); 
    on<StopAudio>(_onStopAudio); 
    on<ResumeAudio>(_onResumeAudio); 
  }

  void _onInitialAudio(PlayAudio event, Emitter<AudioPlayerState> emit) async {
    // await this.audio.player.play();
    // this.currentState.player.stop();
    // this.currentState.player.play(event.remoteURL);
    // yield this.currentState;
  }

  void _onPlayAudio(PlayAudio event, Emitter<AudioPlayerState> emit) async {
    // await this.audio.player.play();
    // this.currentState.player.stop();
    // this.currentState.player.play(event.remoteURL);
    // yield this.currentState;
  }

  void _onPauseAudio(PauseAudio event, Emitter<AudioPlayerState> emit) async {
    // await this.currentState.player.pause();
  }

  void _onStopAudio(StopAudio event, Emitter<AudioPlayerState> emit) async {
    // await this.currentState.player.stop();
  }

  void _onResumeAudio(ResumeAudio event, Emitter<AudioPlayerState> emit) async {
    // await this.currentState.player.stop();
  }
}


// class AudioPlayerBloc extends Bloc<AudioPlayerEvents, MusicPlayerState> {
//   @override
//   MusicPlayerState get initialState => MusicPlayerState(
//         player: AudioPlayer(),
//         episode: Episode(),
//       );

//   @override
//   Stream<MusicPlayerState> mapEventToState(AudioPlayerEvents event) async* {
//     if (event is InitializePlayer) {
//       this.currentState.episode = event.episode;
//       this.dispatch(PlayPlayer());
//       yield this.currentState;
//     }

//     if (event is PlayPlayer) {
//       this.play(this.currentState.episode.source);
//     }

//     if (event is PlayRemote) {
//       this.currentState.player.stop();

//       this.currentState.player.play(event.remoteURL);
//       yield this.currentState;
//     }

//     if (event is ShowPlayer) {
//       yield this.currentState;
//     }

//     if (event is HidePlayer) {
//       yield this.currentState;
//     }
//   }