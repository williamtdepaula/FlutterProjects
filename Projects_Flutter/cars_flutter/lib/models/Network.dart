import 'package:connectivity/connectivity.dart';

class Network {
  static Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) return false;
    return true;
  }
}
