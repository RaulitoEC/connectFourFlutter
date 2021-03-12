import '../Player.dart';

class ScreenArguments {
  Player p1;

  ScreenArguments(p1) {
    this.p1 = p1;
  }

  getPlayer() {
    return p1;
  }
}
