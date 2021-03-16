import 'package:flutter/material.dart';

import 'ColorChip.dart';

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