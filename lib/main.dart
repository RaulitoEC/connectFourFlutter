import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './Player.dart';

import './screens/GameScreen.dart';
import './screens/StartScreen.dart';
import './screens/SettingsScreen.dart';


void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode)
      exit(1);
  };
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Player1('1', 'Player 1', Colors.yellow)),
        ChangeNotifierProvider(create: (context) => Player2('2', 'Player 2', Colors.red)),
      ],
      child: MyHomePage(),
    )
  );
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: StartScreen.id,
      routes: {
        StartScreen.id: (context) => StartScreen(),
        SettingsScreen.id: (context) => SettingsScreen(),
        GameScreen.id: (context) => GameScreen(),
      }
    );
  }
}
