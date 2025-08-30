class ApiConstant {
  //localhost:3050/categories/public/
  static const String baseUrl = 'http://172.27.240.1:3050/';

  // todo: for emulator: 172.23.16.1
  // todo: for mobile: 192.168.43.22
  static const String signup = 'auth/public/sign-up';
  static const String login = 'auth/public/sign-in';
  static const String refreshToken = 'auth/public/refresh-token';
  static const String levelQuestion = 'questions/public/leveling';

  static const String category = 'categories/public';
  static const String subCategory = 'categories/public/sub-categories';
  static const String levels = 'resources/public';




  // static const String resources = 'resources/';
}
// 10.2.0.2
// 192.168.58.1 -> done for mobile for wifi
// 192.168.117.1 -> done for mobile (wifi and internet -> error , success for emulator )

// 192.168.1.7 -> done for mobile (wifi and internet -> error) -> not found

//192.168.1.10

//127.0.0.1