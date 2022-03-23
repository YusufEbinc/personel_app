import 'package:flutter/material.dart';
import 'package:personel_app/core/constants/text_form_field/raunded_input_field.dart';
import 'package:personel_app/core/extension/color.dart';
import 'package:personel_app/core/extension/responsive.dart';
import 'package:personel_app/core/extension/string_constant.dart';
import 'package:personel_app/services/authenticate_service.dart';
import 'package:personel_app/views/authenticate/login/login_view.dart';
import 'package:personel_app/views/home/home_view.dart';

import 'package:provider/provider.dart';

class RegisterView extends StatefulWidget {
  static String routeName = StringConstants.instance.register;
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late AuthService authService;
  @override
  void initState() {
    authService = AuthService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthService>(context);
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringConstants.instance.register,
        ),
      ),
      body: Center(
        child: SizedBox(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 15.0),
                  Container(
                    height: SizeConfig.screenHeight * .2,
                    width: SizeConfig.screenWidth / 2,
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  const SizedBox(height: 15.0),
                  RoundedInputField(
                    controller: emailController,
                    height: SizeConfig.screenHeight * .07,
                    width: SizeConfig.screenWidth * .6,
                    radius: 12,
                    hintText: StringConstants.instance.email,
                    backroundColor: whiteColor,
                    prefixClick: () {},
                    suffixClick: () {},
                    icon: Icons.email_outlined,
                    validator: (value) {
                      if (value!.length < 3 || !value.contains('@')) {
                        return StringConstants.instance.pleaseEnterValidEmail;
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 15.0),
                  RoundedInputField(
                      controller: passwordController,
                      height: SizeConfig.screenHeight * .07,
                      width: SizeConfig.screenWidth * .6,
                      radius: 12,
                      hintText: StringConstants.instance.password,
                      backroundColor: whiteColor,
                      prefixClick: () {},
                      suffixClick: () {},
                      validator: (value) {
                        if (value!.length < 5) {
                          return StringConstants
                              .instance.pleaseEnterValidPassword;
                        } else {
                          return null;
                        }
                      },
                      icon: Icons.visibility),
                  const SizedBox(height: 15.0),
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    height: SizeConfig.screenHeight * .07,
                    width: SizeConfig.screenWidth * .6,
                    child: ElevatedButton(
                      onPressed: () async {
                        await provider
                            .createUser(
                                emailController.text, passwordController.text)
                            .then(
                          (value) {
                            if (value?.emailVerified != null) {
                              Navigator.pushNamed(context, HomeView.routeName);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(provider.error),
                                ),
                              );
                            }
                          },
                        );
                      },
                      child: Text(
                        StringConstants.instance.login,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: blueColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        textStyle:
                            const TextStyle(color: whiteColor, fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    height: SizeConfig.screenHeight * .07,
                    width: SizeConfig.screenWidth * .6,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, LoginView.routeName);
                      },
                      child: Text(
                        StringConstants.instance.login,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: blueColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        textStyle:
                            const TextStyle(color: whiteColor, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
