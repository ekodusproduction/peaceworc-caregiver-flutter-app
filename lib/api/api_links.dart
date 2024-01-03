class ApiLinks{
  static const String baseUrl = debugUrl;
  //static const String debugUrl = 'https://peaceworc-phase2-dev.ekodusproject.tech/api/caregiver/';
  static const String debugUrl = "http://peaceworc.com/api/caregiver/";
  static const String  PUBLIC_URL = "http://peaceworc.com/";

  static const  NODE_URL = "http://134.209.119.88";
  //static const String debugUrl = 'http://143.110.244.161/api/caregiver/';
  static const String certificateUploadUrl = 'profile/certificate/add';
  static const String login = 'login';
  static const String signUpUrl = 'signup';
  static const String verifyOtpUrl = 'verify-otp';
  static const String getJobsUrl = 'job/get-jobs';
  static const String logoutUrl = 'logout';
  static const String fetchBidJobUrl = 'job/get-bidded-jobs';
  static const String fetchAwardedJobUrl = '/job/ongoing/get';
  static const String fetchProfileDetailUrl = '/profile/get-details';
  static const String fetchCompletedJobUrl = '/job/complete-job/get';
  static const String fetchQuickCallJobUrl = '/job/quick-call/get?id=0&page=1';
  static const String fetchQuickCallDetailJobUrl = 'job/quick-call/get?id=';
  static const String changePasswordUrl = 'profile/change-password';
  static const String fetchChatsUrl = 'chatting/get-chats';
  static const String basicInformation = 'profile/registration/basic-information';
  static const String optionalInformation = 'profile/registration/optional-information';
  static const String getDocument = 'document/get';
  static const String uploadDocument = 'document/upload';

}