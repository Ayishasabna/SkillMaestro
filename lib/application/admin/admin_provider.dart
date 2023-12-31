import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/common/widgets/bottom_nav_bar.dart';
import '../../admin/model/admin_sign_in_req_model.dart';
import '../../admin/controller/authentication/admin_signin_api_service.dart';
import '../common/common_provider.dart';

class AdminProvider with ChangeNotifier {
  FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<void> checkAdminSignIn(
      BuildContext context, emailData, passwordData) async {
    final email = emailData;
    final password = passwordData;
    final signAdminDatas =
        AdminSignInReqModel(email: email, password: password);
    final tokenData =
        await AdminSignInApiService().adminSignIn(signAdminDatas, context);
    if (tokenData?.token != null) {
      log(tokenData!.token.toString(), name: 'admin token');
      await storage.write(
          key: 'admin_access_token', value: jsonEncode(tokenData.token));
      log("admin_access_token ${tokenData.token}");
      notifyListeners();

      if (context.mounted) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomNavBar(),
            ),
            (route) => false);
      }
      notifyListeners();
    }
    //UserLogin().disposeTextFiled();
    if (context.mounted) {
      Provider.of<CommonProvider>(context, listen: false).offLoading();
    }
  }
}
