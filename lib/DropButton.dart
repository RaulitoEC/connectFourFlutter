import 'package:flutter/material.dart';

class DropChipButton extends StatelessWidget {
  @override
  Widget build(buildContext) {
    return ElevatedButton(
      child: Text("Click Me"),
      onPressed: () { print('click me'); },
    );
  }
}