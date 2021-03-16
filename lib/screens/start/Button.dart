import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final label;
  final path;

  Button(this.label, this.path);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => Navigator.pushNamed(context, path,),
      child: Text(label, style: TextStyle(color: Colors.white))
    );
  }
}
