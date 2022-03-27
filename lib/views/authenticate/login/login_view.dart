import 'package:flutter/material.dart';
import 'package:personel_app/core/constants/button/default_button.dart';
import 'package:personel_app/core/constants/text_form_field/raunded_input_field.dart';
import 'package:personel_app/core/extension/color.dart';
import 'package:personel_app/core/extension/responsive.dart';
import 'package:personel_app/core/extension/string_constant.dart';
import 'package:personel_app/services/authenticate_service.dart';
import 'package:personel_app/views/authenticate/register/register_view.dart';
import 'package:personel_app/views/bottom_navigaton_bar/bottom_navigation_bar.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  static String routeName = StringConstants.instance.loginView;
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthService>(context);
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringConstants.instance.login,
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
                  DefaultButton(
                    height: SizeConfig.screenHeight * .07,
                    width: SizeConfig.screenWidth * .6,
                    buttonColor: blueColor,
                    radius: 20,
                    text: StringConstants.instance.login,
                    buttonTextColor: blackColor,
                    buttonTextFontSize: 20,
                    press: () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();

                        await provider
                            .signInUser(
                                emailController.text, passwordController.text)
                            .then(
                          (value) {
                            if (value?.uid != null) {
                              Navigator.pushReplacementNamed(
                                  context, BottomNavigationView.routeName);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(provider.error),
                                ),
                              );
                            }
                          },
                        );
                      } else {
                        return debugPrint('erorrr');
                      }
                    },
                  ),
                  const SizedBox(height: 15),
                  DefaultButton(
                    height: SizeConfig.screenHeight * .07,
                    width: SizeConfig.screenWidth * .6,
                    buttonColor: blueColor,
                    radius: 20,
                    text: StringConstants.instance.register,
                    buttonTextColor: blackColor,
                    buttonTextFontSize: 20,
                    press: () {
                      Navigator.pushNamed(context, RegisterView.routeName);
                    },
                  ),
                  const SizedBox(height: 15),
                  DefaultButton(
                    height: SizeConfig.screenHeight * .07,
                    width: SizeConfig.screenWidth * .6,
                    buttonColor: blueColor,
                    radius: 20,
                    text: 'Google ile giriş',
                    buttonTextColor: whiteColor,
                    buttonTextFontSize: 20,
                    press: () {
                      provider.signInWithGoogle().then((value) => {
                            if (value.user?.emailVerified == true)
                              {
                                Navigator.pushReplacementNamed(
                                    context, BottomNavigationView.routeName)
                              }
                          });
                    },
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
