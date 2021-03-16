import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/Player.dart';
import '../start/StartScreen.dart';

import './ColorChartPicker.dart';

class SettingsScreen extends StatefulWidget {
  static const String id = '/settings';
  @override
  _SettingsScreen createState() => _SettingsScreen();
}

class _SettingsScreen extends State<SettingsScreen> {
  int currentPlayer = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Player', style: TextStyle(decoration: TextDecoration.none)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                setState(() { currentPlayer = 1; });
              },
              child: Text("Player 1", style: TextStyle(color: Colors.white))
            ),
            FlatButton(
              onPressed: () {
                setState(() { currentPlayer = 2; });
              },
              child: Text("Player 2", style: TextStyle(color: Colors.white))
            ),
          ]
        ),
        Text('choose your color', style: TextStyle(decoration: TextDecoration.none, fontSize: 20)),
        Builder(
          builder: (context) {
            return currentPlayer == 1
              ? Consumer<Player1>(
                builder: (context, player, child) {
                  return ColorChartPicker(player.color, player.setColor);
                }
              )
              : Consumer<Player2>(
                builder: (context, player, child) {
                  return ColorChartPicker(player.color, player.setColor);
                }
              );
          }
        ),
        FlatButton(
          onPressed: () {
            return Navigator.pushNamed(context, StartScreen.id);
          },
          child: Text("back", style: TextStyle(color: Colors.white))
        )
      ],
    );
  }
}