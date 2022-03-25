import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:personel_app/core/extension/custom_thema.dart';
import 'package:personel_app/core/extension/route.dart';
import 'package:personel_app/services/authenticate_service.dart';
import 'package:personel_app/services/firebase_service.dart';
import 'package:personel_app/views/authenticate/splash/splas_view.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FirebaseService(),
        ),
        Provider(
          create: ((context) => AuthService()),
        ),
        //  StreamProvider.value(value: value, initialData: initialData)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        routes: routes,
        theme: theme(),
        initialRoute: SplasView.routeName,
      ),
    );
  }
}
