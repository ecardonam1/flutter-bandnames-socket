import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

enum ServerStatus { online, offline, connecting }

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.connecting;
  late IO.Socket _socket;

  ServerStatus get serverStatus => _serverStatus;
  IO.Socket get socket => _socket;
  Function get emit => _socket.emit;

  SocketService() {
    initConfig();
  }

  initConfig() {
    _socket = IO.io(
        'http://192.168.20.112:3000',
        OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .enableAutoConnect() // optional
            .build());

    _socket.onConnect((_) {
      _serverStatus = ServerStatus.online;
      notifyListeners();
    });

    _socket.onDisconnect((_) {
      _serverStatus = ServerStatus.offline;
      notifyListeners();
    });

    // _socket.on('nuevo-mensaje', (payload) {
    //   log('nuevo-mensaje:');
    //   log('nombre: ' + payload['nombre']);
    //   log('mensaje:' + payload['mensaje']);
    //   log(payload.containsKey('mensaje2') ? payload['mensaje2'] : 'no hay');
    // });
  }
}
