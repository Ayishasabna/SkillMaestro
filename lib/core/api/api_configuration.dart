class ApiConfigration {
  static const ipAddress = ' 10.0.12.48';
  static const baseUrl = "http://$ipAddress:4000";

  //----User Endpoints---
  static const signin = '/signin';
  static const login = '/login';
  static const otp = '/OTP';
  static const verifyOtp = '/verify-otp';
  //static const userProfile = '/userProfile';

  //after baseUrl
  static const admin =
      '/admin'; //add this /admin before adding endopoints listed down

  static const adminLogin = '/login';
}
