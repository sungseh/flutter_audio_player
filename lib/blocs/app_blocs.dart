import 'package:flutter_bloc/flutter_bloc.dart';

import 'audio_player/audio_player_bloc.dart';

class AppBloc {
  static final AudioPlayerBloc audioPlayerBloc = AudioPlayerBloc();

  static final List<BlocProvider> providers = [
    BlocProvider<AudioPlayerBloc>(
      create: (context) => audioPlayerBloc,
    )
  ];

  static void dispose(){
    audioPlayerBloc.close();
  }

  //Singleton factory
  static final AppBloc _instance = AppBloc._internal();

  factory AppBloc(){
    return _instance;
  }

  AppBloc._internal();

}