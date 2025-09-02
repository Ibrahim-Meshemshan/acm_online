class ApiConstant {
  //localhost:3050/categories/public/
  // static const String baseUrl = 'http://172.27.240.1:3050/'; // nativve
  static const String baseUrl =
      'http://192.168.1.9:3050/'; // شغال عالموبايل بدون في بي ان وعاللاب مع في بي ان

  // todo: for emulator: 172.23.16.1
  // todo: for mobile: 192.168.43.22
  static const String signup = 'auth/public/sign-up';
  static const String login = 'auth/public/sign-in';
  static const String logout = 'auth/log-out';
  static const String authMe = 'auth/me';
  static const String refreshToken = 'auth/public/refresh-token';
  static const String levelQuestion = 'questions/public/leveling';
  static const String category = 'categories/public';
  static const String subCategory = 'categories/public/sub-categories';
  static const String levels = 'resources/public';
  static const String profile = 'user/profile';
  static const String leaderAndResults = 'results/public';
  // static const String resources = 'resources/';
}
