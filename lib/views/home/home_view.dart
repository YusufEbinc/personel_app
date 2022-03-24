import 'package:flutter/material.dart';
import 'package:personel_app/core/constants/text_form_field/raunded_input_field.dart';
import 'package:personel_app/core/extension/color.dart';
import 'package:personel_app/core/extension/responsive.dart';
import 'package:personel_app/core/extension/string_constant.dart';
import 'package:personel_app/services/authenticate_service.dart';
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
    SizeConfig().init(context);
    final provider = Provider.of<AuthService>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(StringConstants.instance.home),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              height: SizeConfig.screenHeight * .55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: whiteColor),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: scafoldbackclr,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          height: SizeConfig.screenHeight * .07,
                          width: SizeConfig.screenWidth * .5,
                          child: Center(
                            child: Text(
                              StringConstants.instance.addData,
                              style: TextStyle(
                                  fontSize: SizeConfig.screenHeight * .03,
                                  color: blackColor),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        RoundedInputField(
                          // controller: emailController,
                          radius: 12,
                          height: SizeConfig.screenHeight * .07,
                          hintText: StringConstants.instance.expenses,
                          backroundColor: whiteColor,
                          validator: (value) {
                            if (value!.length < 3 || !value.contains('@')) {
                              return StringConstants
                                  .instance.pleaseEnterValidEmail;
                            } else {
                              return null;
                            }
                          },
                        ),
                        RoundedInputField(
                          height: SizeConfig.screenHeight * .07,
                          // controller: emailController,
                          radius: 12,
                          hintText: StringConstants.instance.payment,
                          backroundColor: whiteColor,
                          validator: (value) {
                            if (value!.length < 3 || !value.contains('@')) {
                              return StringConstants
                                  .instance.pleaseEnterValidEmail;
                            } else {
                              return null;
                            }
                          },
                        ),
                        RoundedInputField(
                          // controller: emailController,
                          radius: 12,
                          height: SizeConfig.screenHeight * .07,
                          hintText: StringConstants.instance.price,
                          backroundColor: whiteColor,
                          validator: (value) {
                            if (value!.length < 3 || !value.contains('@')) {
                              return StringConstants
                                  .instance.pleaseEnterValidEmail;
                            } else {
                              return null;
                            }
                          },
                        ),
                        RoundedInputField(
                          // controller: emailController,
                          radius: 12,
                          height: SizeConfig.screenHeight * .07,
                          hintText: StringConstants.instance.date,
                          backroundColor: whiteColor,
                          validator: (value) {
                            if (value!.length < 3 || !value.contains('@')) {
                              return StringConstants
                                  .instance.pleaseEnterValidEmail;
                            } else {
                              return null;
                            }
                          },
                        ),
                      ]),
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: whiteColor,
          child: const Icon(
            Icons.check,
            color: blackColor,
            size: 25,
          ),
        ));
  }
}
