class StringConstants {
  static StringConstants? _instance;
  static StringConstants get instance => _instance ??= StringConstants._();

  StringConstants._();

  String successfulLogin = 'Successful Login';
  String pleaseEnterValidEmail = 'Please enter a valid email ';
  String pleaseEnterValidPassword = 'Please enter a valid password';
  String loginView = 'LoginView';
  String splasView = 'splashView';
  String homeView = 'homeView';
  String register = 'Register';
  String errorValue = 'error';
  String password = 'password';
  String login = 'Login';
  String email = 'email';
  String home = 'Home';
  String logout = 'Log Out';
}
