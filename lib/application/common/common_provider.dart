import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class CommonProvider extends ChangeNotifier {
  bool clickLoading = false;
  bool loading = false;
  //bool get isLoading => clickLoading;

  void showSuccessSnackBar(context) {
    showTopSnackBar(
      Overlay.of(context),
      const CustomSnackBar.success(
        message: 'Congrats..OTP Verification Success',
      ),
    );
  }

  void showInvalidOtpSnack(context) {
    showTopSnackBar(
      Overlay.of(context),
      const CustomSnackBar.error(
        message: 'Invalid OTP Entered',
      ),
    );
  }

  void showSomethingWentWrongSnack(context) {
    showTopSnackBar(
      Overlay.of(context),
      const CustomSnackBar.info(
        message: 'Something Went Wrong!',
      ),
    );
  }

  void userNotExist(
    context,
  ) {
    showTopSnackBar(
      Overlay.of(context),
      const CustomSnackBar.error(
        message: 'Incorrect Username Or Password',
      ),
    );
  }

  void userAlreadyExist(
    context,
  ) {
    showTopSnackBar(
      Overlay.of(context),
      const CustomSnackBar.error(
        message: 'User With This Email Already Exist',
      ),
    );
  }

  void userOtpSend(
    context,
  ) {
    showTopSnackBar(
      Overlay.of(context),
      const CustomSnackBar.success(
        message: 'OTP sended',
      ),
    );
  }

  void setClickLoading(value) {
    clickLoading = value;
    notifyListeners();
  }

  set isLoading(bool value) {
    clickLoading = value;
    notifyListeners();
  }

  void onloading() {
    log('loading on');
    loading = true;
    notifyListeners();
  }

  void offLoading() {
    loading = false;
    notifyListeners();
  }
}
