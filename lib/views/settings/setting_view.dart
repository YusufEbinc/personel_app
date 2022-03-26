import 'package:flutter/material.dart';
import 'package:personel_app/core/extension/string_constant.dart';
import 'package:personel_app/services/authenticate_service.dart';
import 'package:personel_app/views/authenticate/login/login_view.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    late int? index = 0;
    final provider = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(StringConstants.instance.settings),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text(StringConstants.instance.settings)),
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
