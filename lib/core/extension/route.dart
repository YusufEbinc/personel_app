import 'package:flutter/material.dart';
import 'package:personel_app/views/authenticate/login/login_view.dart';
import 'package:personel_app/views/authenticate/register/register_view.dart';
import 'package:personel_app/views/authenticate/splash/splas_view.dart';
import 'package:personel_app/views/bottom_navigaton_bar/bottom_navigation_bar.dart';
import 'package:personel_app/views/home/home_view.dart';

final Map<String, WidgetBuilder> routes = {
  LoginView.routeName: (context) => const LoginView(),
  HomeView.routeName: (context) => const HomeView(),
  SplasView.routeName: (context) => const SplasView(),
  RegisterView.routeName: (context) => const RegisterView(),
  BottomNavigationView.routeName: (context) => const BottomNavigationView()
};
