import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:personel_app/core/extension/string_constant.dart';
import 'package:personel_app/services/authenticate_service.dart';
import 'package:personel_app/views/authenticate/login/login_view.dart';
import 'package:personel_app/views/home/home_view.dart';
import 'package:provider/provider.dart';

class SplasView extends StatelessWidget {
  static String routeName = StringConstants.instance.splasView;
  const SplasView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
      stream: provider.user,
      builder: (context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          return user == null ? const LoginView() : const HomeView();
        } else {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
