import 'package:charts_flutter_new/flutter.dart';

class ApiConfigration {
  static const ipAddress = "192.168.1.87";
  //'10.4.1.200';
  static const baseUrl = "http://$ipAddress:4000";

  //----User Endpoints---
  static const verifyOtp = '/verify-otp';
  static const signUp = '/signup';
  static const signin = '/signin';
  static const get7Jobs = '/get7Jobs';
  static const userAuth = '/isUserAuth';
  static const jobDetail = '/jobDetail/{id}';
  static const getSlots = '/getSlots/';
  static const addAddress = '/addAddress';
  static const bookJob = '/bookJob';
  static const getContacts = '/getContacts';
  static const getMessage = '/getMessage';

  //static const login = '/login';
  //static const otp = '/OTP';

  //static const userProfile = '/userProfile';

  //----Expert Endpoints---
  static const expertSignUp = '/expert/signup';
  static const expertSignIn = '/expert/signin';
  static const verifyExpertOtp = '/expert/verify-otp';
  static const expertAuth = '/expert/isExpertAuth';
  static const editProfile = '/expert/editProfile';
  static const getMyJobs = '/expert/getMyJobs';
  static const getAllJobs = '/expert/getAllJobs';
  static const addSkill = '/expert/addSkill';
  static const removeSkill = '/expert/removeSkill';
  static const addShedule = '/expert/addSchedule';
  static const getSchedule = '/expert/getSchedule';
  static const myBookings = '/expert/myBookings';

  // static const signUp = '/signup';

  //after baseUrl
  static const admin = "/admin";
  //add this /admin before adding endopoints listed down
  static const adminAuth = '/isAdminAuth';
  static const getExperts = '/getExperts';
  static const getUsers = '/getUsers';
  static const getJobs = '/getJobs';
  static const addJobs = '/addjobs';
  static const blockExpert = '/blockExpert';
  static const blockUser = '/blockUser';
  static const unBlockUser = '/unBlockUser';

  //static const adminLogin = '/login';
}
