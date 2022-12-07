part of "audio_player_bloc.dart";

abstract class AudioPlayerEvent extends Equatable {
  const AudioPlayerEvent();

  @override
  List<Object> get props => [];
}

class PlayAudio extends AudioPlayerEvent { 
  const PlayAudio();

  @override
  List<Object> get props => [];
}

class PauseAudio extends AudioPlayerEvent {  
  const PauseAudio();

  @override
  List<Object> get props => []; 
}

class StopAudio extends AudioPlayerEvent {  
  const StopAudio();

  @override
  List<Object> get props => []; 
}

class ResumeAudio extends AudioPlayerEvent {  
  const ResumeAudio();

  @override
  List<Object> get props => []; 
}
 