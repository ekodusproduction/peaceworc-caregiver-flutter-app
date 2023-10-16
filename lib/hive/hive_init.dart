
import 'package:hive_flutter/adapters.dart';

Future<void> initFlutterHive() async {
  await Hive.initFlutter();
  await Hive.openBox("user_data");
}

Future<void> saveToken(String token) async {
  await Hive.box("user_data").put("token", token);
  //print(getToken());
}
Future<void> saveRefreshToken(String token) async{
  await Hive.box("user_data").put('refresh_token', token);
}

String? getToken() {
  return Hive.box("user_data").get("token", defaultValue: null);
}
String? getRefreshToken(){
  return Hive.box("user_data").get("refresh_token");
}