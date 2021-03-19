import 'package:flutter/material.dart';
import './../../components/Chips.dart';

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

  static const List colorOptions = [
    [Colors.pink, Colors.red, Colors.deepOrange, Colors.orange,],
    [Colors.amber, Colors.yellow, Colors.lime, Colors.lightGreen,],
    [Colors.green,Colors.teal, Colors.cyan, Colors.lightBlue,],
    [Colors.blue, Colors.indigo, Colors.deepPurple, Colors.purple],
  ];

  _ColorChartPicker(this.selectedColor, this.savePlayerColor);

  void changeColor(Color color) {
    setState(() {
      selectedColor = color;
    });
  }

  List<Widget> buildRows() {
    List<Widget> rowItems = [];
    List<Widget> rows = [];
    for (int i = 0; i < colorOptions.length; i++) {
      rowItems = [];
      for (int j = 0; j < colorOptions[i].length; j++) {
        rowItems.add(
          SelectableChip(
            UniqueKey(),
            colorOptions[i][j],
            selectedColor == colorOptions[i][j],
            changeColor
          )
        );
      }
      rows.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center Row contents horizontally,
          children: rowItems.toList()
        )
      );
    }
    return rows.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(children: buildRows(),),
        FlatButton(
          onPressed: () { savePlayerColor(selectedColor); },
          child: Text("Save", style: TextStyle(color: Colors.white))
        ),
      ],
    );
  }
}