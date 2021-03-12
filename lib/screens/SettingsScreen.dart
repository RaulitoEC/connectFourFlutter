import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './../Player.dart';
import './StartScreen.dart';

class SettingsScreen extends StatefulWidget {
  static const String id = 'SettingsScreen';
  @override
  _SettingsScreen createState() => _SettingsScreen();
}

class ColorChip extends StatelessWidget {
  final Color color;
  final Color playerColor;
  final void Function(Color) changeColor;

  ColorChip(this.color, this.playerColor, this.changeColor);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        child: Container(
          width  : 50.0,
          height : 50.0,
          decoration : new BoxDecoration(
            color : color,
            shape : BoxShape.circle
          ),
          child: playerColor == color
            ? Icon(Icons.mouse, size:30,)
            : null
        ),
        onTap: () { changeColor(color); }
      )
    );
  }
}

class ColorChartPicker extends StatefulWidget {
  final Color originalColor;
  final void Function(Color) savePlayerColor;

  ColorChartPicker(this.originalColor, this.savePlayerColor);

  @override
  _ColorChartPicker createState() => _ColorChartPicker(originalColor, savePlayerColor);
}

class _ColorChartPicker extends State<ColorChartPicker> {
  Color selectedColor;
  void Function(Color) savePlayerColor;

  _ColorChartPicker(this.selectedColor, this.savePlayerColor);

  void changeColor(Color color) {
    setState(() {
      selectedColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
          children: <Widget>[
            ColorChip(Colors.pink, selectedColor, this.changeColor),
            ColorChip(Colors.red, selectedColor, this.changeColor),
            ColorChip(Colors.deepOrange, selectedColor, this.changeColor),
            ColorChip(Colors.orange, selectedColor, this.changeColor),
          ]
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
          children: <Widget>[
            ColorChip(Colors.amber, selectedColor, this.changeColor),
            ColorChip(Colors.yellow, selectedColor, this.changeColor),
            ColorChip(Colors.lime, selectedColor, this.changeColor),
            ColorChip(Colors.lightGreen, selectedColor, this.changeColor),
          ]
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
          children: [
            ColorChip(Colors.green, selectedColor, this.changeColor),
            ColorChip(Colors.teal, selectedColor, this.changeColor),
            ColorChip(Colors.cyan, selectedColor, this.changeColor),
            ColorChip(Colors.lightBlue, selectedColor, this.changeColor),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
          children: [
            ColorChip(Colors.blue, selectedColor, this.changeColor),
            ColorChip(Colors.indigo, selectedColor, this.changeColor),
            ColorChip(Colors.deepPurple, selectedColor, this.changeColor),
            ColorChip(Colors.purple, selectedColor, this.changeColor),
          ],
        ),
        FlatButton(
          onPressed: () { savePlayerColor(selectedColor); },
          child: Text("Save", style: TextStyle(color: Colors.white))
        ),
      ],
    );
  }
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