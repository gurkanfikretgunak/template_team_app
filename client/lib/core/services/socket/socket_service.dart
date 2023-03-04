import 'package:logger/logger.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  late IO.Socket socket;

  SocketService() {
    socketBuilder();
  }

  void socketBuilder() async {
    socket = IO.io(
      'http://192.168.1.35:5000',
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .build(),
    );
    socket.connect();
    if (socket.active) {
      connectSocket();
    }
  }

  void connectSocket() async {
    socket.onConnect((data) => print('Connection established'));
    socket.onConnectError((data) => print('Connect Error: $data'));
    socket.onDisconnect((data) => print('Socket.IO server disconnected'));

    socket.on("get-notification", (data) async {
      Logger().e(data['type']);
    });
  }
}
