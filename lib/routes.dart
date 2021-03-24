import 'package:connect_four_client/screens/lobby/LobbyScreen.dart';
import 'package:flutter/widgets.dart';

import 'screens/game/GameScreen.dart';
import 'screens/lobby/LobbyScreen.dart';
import 'screens/settings/SettingsScreen.dart';
import 'screens/start/StartScreen.dart';

// Simple map of all routes in the app
final Map<String, WidgetBuilder> routes = <String, WidgetBuilder> {
  GameScreen.id: (context) => GameScreen(),
  LobbyScreen.id: (context) => LobbyScreen(),
  SettingsScreen.id: (context) => SettingsScreen(),
  StartScreen.id: (context) => StartScreen(),
};
