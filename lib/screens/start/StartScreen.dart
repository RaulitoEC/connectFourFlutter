import 'package:flutter/material.dart';
import '../game/GameScreen.dart';
import '../settings/SettingsScreen.dart';

import './Button.dart';

class StartScreen extends StatelessWidget {
  static const String id = '/';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Button('Solo Play', GameScreen.id),
        Button('Local VS', GameScreen.id),
        // Button('Online VS', GameScreen.id),
        Button('Settings', SettingsScreen.id),
      ]
    );
  }
}
