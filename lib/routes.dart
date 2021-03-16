import 'package:flutter/widgets.dart';

import 'screens/game/GameScreen.dart';
import 'screens/start/StartScreen.dart';
import 'screens/settings/SettingsScreen.dart';

// Simple map of all routes in the app
final Map<String, WidgetBuilder> routes = <String, WidgetBuilder> {
  StartScreen.id: (context) => StartScreen(),
  SettingsScreen.id: (context) => SettingsScreen(),
  GameScreen.id: (context) => GameScreen(),
};
