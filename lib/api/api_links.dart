class ApiLinks{
  static const String baseUrl = debugUrl;
  static const String debugUrl = 'https://peaceworc-phase2-dev.ekodusproject.tech/api/caregiver/';
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
  static const String changePasswordUrl = 'profile/change-password';
}