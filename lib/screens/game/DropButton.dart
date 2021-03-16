import 'package:flutter/material.dart';

class DropButton extends StatelessWidget {
  final bool show;
  final double size = 30;
  final void Function() cb;

  DropButton(this.show, this.cb);

  @override
  Widget build(BuildContext context) {
    return show
      ? Material(
        child: InkWell(
          child: Icon(Icons.south, size:size),
          onTap: () { cb(); }
        )
      )
      : Container(width: size, height: size,);
  }
}