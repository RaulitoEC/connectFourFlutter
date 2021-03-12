import 'package:flutter/material.dart';
import './GameScreen.dart';
import './SettingsScreen.dart';

class StartScreen extends StatefulWidget {
  static const String id = '/';

  @override
  _StartScreen createState() => _StartScreen();
}

class _StartScreen extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // FlatButton(
        //   onPressed: () => Navigator.pushNamed(context, GameScreen.id,),
        //   child: Text("Solo Play", style: TextStyle(color: Colors.white))
        // ),
        FlatButton(
          onPressed: () => Navigator.pushNamed(context, GameScreen.id,),
          child: Text("Local VS", style: TextStyle(color: Colors.white))
        ),
        // FlatButton(
        //   onPressed: () => Navigator.pushNamed(context, 'GameScreen'),
        //   child: Text("Online VS", style: TextStyle(color: Colors.white))
        // ),
        FlatButton(
          onPressed: () => Navigator.pushNamed(context, SettingsScreen.id,),
          child: Text("Settings", style: TextStyle(color: Colors.white)),
        )
      ]
    );
  }
}