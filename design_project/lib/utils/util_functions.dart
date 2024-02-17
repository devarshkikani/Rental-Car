import 'package:internet_connection_checker/internet_connection_checker.dart';

Future<bool> isInternetAvailable() async {
  bool result = await InternetConnectionChecker().hasConnection;
  if(result == true) {
    return true;
  } else {
  return false;
  }
}