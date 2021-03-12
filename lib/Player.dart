import 'package:flutter/material.dart';

class Player extends ChangeNotifier {
  Color color;
  String name;

  Player() {
    this.name = "";
    this.color = Colors.white;
  }

  Player.playerWithNameAndColor(String name, Color color) {
    this.name = name;
    this.color = color;
  }

  void setColor(Color color) {
    this.color = color;
    notifyListeners();
  }

  void setName(String name) {
    this.name = name;
    notifyListeners();
  }
}

class Player1 extends Player {
  String pId;

  Player1(String pId, String name, Color color) :
    this.pId = pId,
    super.playerWithNameAndColor(name, color);
}

class Player2 extends Player {
  String pId;

  Player2(String pId, String name, Color color) :
    this.pId = pId,
    super.playerWithNameAndColor(name, color);
}