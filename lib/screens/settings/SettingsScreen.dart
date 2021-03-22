import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/Player.dart';
import '../start/StartScreen.dart';

import './PlayerPicker.dart';
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
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(0, 60, 0, 300),
          height: 60,
          child: CustomPaint(
            size: Size(392.7, 60),
            painter: PlayerPicker(30, 160, currentPlayer),
            child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  TextButton(
                    child: Text(
                      "Player 1",
                      style: currentPlayer == 1
                        ? TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24)
                        : TextStyle(color: Colors.black)
                    ),
                    onPressed: () { setState(() { currentPlayer = 1; }); },
                  ),
                  TextButton(
                    child: Text(
                      "Player 2",
                      style: currentPlayer == 2
                        ? TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24)
                        : TextStyle(color: Colors.white)
                    ),
                    onPressed: () { setState(() { currentPlayer = 2; }); },
                  ),
                ]
              )
            )
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
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
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.fromLTRB(150, 15, 150, 15))
              ),
            )
          ],)
        
      ],
    );
  }
}