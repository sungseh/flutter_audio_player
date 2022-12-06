import 'package:flutter/material.dart';
import 'package:flutter_just_audio/audio_player_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Just Audio',
      debugShowCheckedModeBanner: false, 
      theme: ThemeData( 
        primarySwatch: Colors.blue,
      ),
      home: const AudioPlayerScreen()
    );
  }
}
