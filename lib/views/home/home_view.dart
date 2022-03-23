import 'package:flutter/material.dart';
import 'package:personel_app/core/extension/string_constant.dart';
import 'package:personel_app/services/authenticate_service.dart';
import 'package:personel_app/views/authenticate/login/login_view.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  static String routeName = StringConstants.instance.homeView;
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthService>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(child: Text('Home')),
          ElevatedButton(
              onPressed: () {
                provider.signOut();
                Navigator.pushReplacementNamed(context, LoginView.routeName);
              },
              child: const Text('sign out')),
        ],
      ),
    );
  }
}
