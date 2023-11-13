
import 'package:hive_flutter/adapters.dart';

Future<void> initFlutterHive() async {
  await Hive.initFlutter();
  await Hive.openBox("user_data");
}

Future<void> saveToken(String token) async {
  await Hive.box("user_data").put("token", token);
  //print(getToken());
}
Future<void> saveUserId(int id) async{
  await Hive.box("user_data").put("userId", id);
}

int? getUserId() {
  return Hive.box("user_data").get("userId", defaultValue: 0);
}
Future<void> saveLocation(String location) async{
  await Hive.box("user_data").put("location", location);
}
String? getLocation() {
  return Hive.box("user_data").get("location", defaultValue: "");
}
Future<void> saveRefreshToken(String token) async{

  await Hive.box("user_data").put('refresh_token', token);
}

Future<void> deleteToken() async{
   await Hive.box("user_data").delete("token");

}

String? getToken() {
  return Hive.box("user_data").get("token", defaultValue: null);
}
String? getRefreshToken(){
  return Hive.box("user_data").get("refresh_token");
}