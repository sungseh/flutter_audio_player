import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_just_audio/audio_player_screen.dart';
import 'package:flutter_just_audio/blocs/app_blocs.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBloc.providers, 
      child: MaterialApp(
        title: 'Flutter Just Audio',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const AudioPlayerScreen(), 
        debugShowCheckedModeBanner: false,
      ),
    );



    // return MaterialApp(
    //   title: 'Flutter Just Audio',
    //   debugShowCheckedModeBanner: false, 
    //   theme: ThemeData( 
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: const AudioPlayerScreen()
    // );


  }
}
