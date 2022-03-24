class StringConstants {
  static StringConstants? _instance;
  static StringConstants get instance => _instance ??= StringConstants._();

  StringConstants._();

  String bottomNavigationView = '/bottomNavigationView';
  String loginView = '/LoginView';
  String splasView = '/splashView';
  String homeView = '/homeView';
  String registerview = '/Register';

  String successfulLogin = 'Successful Login';
  String pleaseEnterValidEmail = 'Please enter a valid email ';
  String pleaseEnterValidPassword = 'Please enter a valid password';

  String login = 'Login';
  String home = 'Home';
  String register = 'Register';

  String expenses = 'Expenses';
  String date = 'Date';
  String price = 'Price';
  String payment = 'Payment';
  String addData = 'Add Data ';

  String errorValue = 'error';
  String password = 'password';
  String save = 'Save';
  String email = 'email';
  String logout = 'Log Out';
}
