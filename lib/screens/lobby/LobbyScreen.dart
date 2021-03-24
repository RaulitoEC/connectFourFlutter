import 'package:flutter/material.dart';
// import 'package:flutter_socket_io/socket_io_manager.dart';
// import 'package:flutter_socket_io/flutter_socket_io.dart';
// import 'package:socket_io/socket_io.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../start/StartScreen.dart';
import '../../components/Buttons.dart';

// needs to load all previous games if any
// needs to offer a new game option
// needs search for other player waiting screen
// back needs to cancel both potential calls
class LobbyScreen extends StatefulWidget {
  static const String id = '/lobby';

  @override
  _LobbyScreen createState() => _LobbyScreen();
}

class _LobbyScreen extends State<LobbyScreen> {
  // SocketIO socketIO;

  @override
  Widget build(BuildContext context) {
    // SocketIO socketIO = SocketIOManager().createSocketIO(
    //   'http://raulecollazo.com',
    //   '',
    //   socketStatusCallback: () {
    //     print('something here');
    //   }
    // );
    // socketIO.connect();
    // try 2
    // IO.Socket socket = IO.io('http://raulecollazo.com');
    // socket.on('connection', (_) {
    //   print('connect');
    //   socket.emit('msg', 'test');
    // });
    // socket.on('event', (data) => print(data));
    // socket.on('disconnect', (_) => print('disconnect'));
    // socket.on('fromServer', (_) => print(_));
    // print(socket);
    return BackBtn(() { return Navigator.pushNamed(context, StartScreen.id); });
  }
}