
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<String> getUserAccesToken() async {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  String? accesToken = await storage.read(key: 'user_access_token');
  String? token = accesToken!.replaceAll('"', '');
  
  return token;
}

Future<String> getCurrentUserId() async {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  String? pId = await storage.read(key: 'currentUserId');
  String? id = pId!.replaceAll('"', '');
  return id;
}

Future<String> getCurrentUserName() async {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  String? pId = await storage.read(key: 'currentUserName');
  String? id = pId!.replaceAll('"', '');
  return id;
}

Future<String> getCurrentExpertId() async {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  String? pId = await storage.read(key: 'currentExpertId');
  String? id = pId!.replaceAll('"', '');
  return id;
}

Future<String?> getExpertAccesToken() async {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  String? accesToken = await storage.read(key: 'expert_access_token');
  String? token;
  if (accesToken != null) {
    token = accesToken.replaceAll('"', '');
    return token;
  }
  return null;
}

Future<String> getAdminAccesToken() async {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  String? accesToken = await storage.read(key: 'admin_access_token');
  String? token = accesToken!.replaceAll('"', '');
  return token;
}

Future<void> deleteAdminAccesToken() async {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  storage.delete(key: 'admin_access_token');
}

Future<void> deleteUserAccesToken() async {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  storage.delete(key: 'admin_access_token');
}
