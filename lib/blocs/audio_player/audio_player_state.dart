part of "audio_player_bloc.dart";

abstract class AudioPlayerState extends Equatable {
  final AudioPlayer? audio;

  const AudioPlayerState({this.audio});
  
  @override
  List<Object> get props => [audio!];
}

class AudioPlayerInitial extends AudioPlayerState {
  const AudioPlayerInitial({AudioPlayer? audio}) : super(audio: audio);
  
  @override
  List<Object> get props => [audio!];

}
