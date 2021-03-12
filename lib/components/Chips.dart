import 'package:flutter/material.dart';

class ColorChip extends StatelessWidget {
  final Color color;

  ColorChip(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width  : 50.0,
      height : 50.0,
      decoration : new BoxDecoration(
        color : color,
        shape : BoxShape.circle
      ),
    );
  }
}

class ChipNode {
  Color color;
  String pId;
  int x;
  int y;

  String left;
  String topLeft;
  String top;
  String topRight;
  String right;
  String bottomRight;
  String bottom;
  String bottomLeft;

  ChipNode(x, y, color) {
    this.x = x;
    this.y = y;
    this.color = color;
    setNeighbors(x, y);
  }

  ChipNode.withPlayer(this.x, this.y, pId, color) {
    this.x = x;
    this.y = y;
    this.pId = pId;
    this.color = color;
  }


  void setNeighbors(x, y) {
    this.left = y - 1 >= 0
      ? (x.toString() + '-' + (y - 1).toString())
      : '';

    this.topLeft = y - 1 >= 0 && x + 1 <= 5
      ? ((x + 1).toString() + '-' + (y - 1).toString())
      : '';

    this.top = x + 1 <= 5
      ? ((x + 1).toString() + '-' + y.toString())
      : '';

    this.topRight = x + 1 <= 5 && y + 1 <= 6
      ? ((x + 1).toString() + '-' + (y + 1).toString())
      : '';

    this.right = y + 1 <= 6
      ? (x.toString() + '-' + (y + 1).toString())
      : '';

    this.bottomRight = x - 1 >= 0 && y + 1 <= 6
      ? ((x - 1).toString() + '-' + (y + 1).toString())
      : '';

    this.bottom = x - 1 >= 0
      ? ((x - 1).toString() + '-' + y.toString())
      : '';

    this.bottomLeft = x - 1 >= 0 && y - 1 >= 0
      ? ((x - 1).toString() + '-' + (y - 1).toString())
      : '';
  }
}