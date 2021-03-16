import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/Player.dart';
import './routes.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode)
      exit(1);
  };
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Player1('1', 'Player 1', Colors.yellow)),
        ChangeNotifierProvider(create: (context) => Player2('2', 'Player 2', Colors.red)),
      ],
      child: MyHomePage(),
    )
  );
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: routes
    );
  }
}
