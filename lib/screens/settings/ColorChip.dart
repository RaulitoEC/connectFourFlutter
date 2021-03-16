import 'package:flutter/material.dart';

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