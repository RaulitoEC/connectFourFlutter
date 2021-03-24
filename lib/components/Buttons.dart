import 'package:flutter/material.dart';

// This might need to turn to a BackButton instead of ElevatedButton
class BackBtn extends StatelessWidget {
  final void Function() onPressed;

  BackBtn(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text("back", style: TextStyle(color: Colors.white)),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.grey[800]),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.fromLTRB(150, 15, 150, 15))
      ),
    );
  }
}
