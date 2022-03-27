class StringConstants {
  static StringConstants? _instance;
  static StringConstants get instance => _instance ??= StringConstants._();

  StringConstants._();

  String bottomNavigationView = '/bottomNavigationView';
  String homeDetailView = '/homeDetailView';
  String loginView = '/LoginView';
  String splasView = '/splashView';
  String homeView = '/homeView';
  String registerview = '/Register';

  String successfulLogin = 'Successful Login';
  String registrationSuccessful = 'Registration Successful';
  String pleaseEnterValidEmail = 'Please enter a valid email ';
  String pleaseEnterValidPassword = 'Please enter a valid password';
  String pleaseEnterValidValue = 'Please enter a valid value';
  String pleaseSelectDate = 'Please select a date';

  String login = 'Login';
  String home = 'Home Page';
  String homeDetail = 'Home Page Detail ';
  String register = 'Register';
  String settings = 'Settings';

  String expenses = 'Expenses';
  String date = 'Date';
  String price = 'Price';
  String payment = 'Payment';
  String addData = 'Add Data ';

  String errorValue = 'error';
  String password = 'password';
  String save = 'Save';
  String email = 'email';
  String signin = 'Sign in';
  String signup = 'Sign up';
  String withGoogle = 'with Google';
  String logout = 'Log Out';
}
