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
      // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Player', style: TextStyle(decoration: TextDecoration.none)),
        Container(
          height: 60,
          color: Colors.grey[800],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      setState(() { currentPlayer = 1; });
                    },
                    child: Text("Player 1", style: TextStyle(color: Colors.white)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.red[800])
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() { currentPlayer = 2; });
                    },
                    child: Text("Player 2", style: TextStyle(color: Colors.white.withOpacity(0.5))),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.red[800].withOpacity(0.5)),
                    ),
                  ),
                ]
              ),
            ]
          )
        ),
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
        ElevatedButton(
          onPressed: () { return Navigator.pushNamed(context, StartScreen.id); },
          child: Text("back", style: TextStyle(color: Colors.white)),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.grey[800]),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.fromLTRB(160, 15, 160, 15))
          ),
        )
      ],
    );
  }
}