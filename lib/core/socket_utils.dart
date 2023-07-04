import 'dart:io';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketUtils {
  static String serverIp = 'http://10.0.2.2';
  static const int server_port = 6000;
  static String connectUrl = '$serverIp:$server_port';

  //Events
  static const String onMessagerecieved = 'receive_message';
  static const String isUserOnlineEvent = 'check_online';

  //Status

  static const int statusMessageNotSend = 10001;
  static const int statusMessageSend = 10002;

  IO.Socket? socket;
}
