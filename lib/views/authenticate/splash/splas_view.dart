import 'package:flutter/material.dart';
import 'package:personel_app/core/extension/string_constant.dart';
import 'package:personel_app/model/user_model.dart';
import 'package:personel_app/services/authenticate_service.dart';
import 'package:personel_app/views/authenticate/login/login_view.dart';
import 'package:personel_app/views/bottom_navigaton_bar/bottom_navigation_bar.dart';
import 'package:provider/provider.dart';

class SplasView extends StatelessWidget {
  static String routeName = StringConstants.instance.splasView;
  const SplasView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthService>(context);
    return StreamBuilder<UserModel?>(
      stream: provider.user,
      builder: (context, AsyncSnapshot<UserModel?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final UserModel? user = snapshot.data;
          return user == null
              ? const LoginView()
              : const BottomNavigationView();
        } else {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
