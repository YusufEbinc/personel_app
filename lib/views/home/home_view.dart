import 'package:flutter/material.dart';
import 'package:personel_app/core/constants/text_form_field/raunded_input_field.dart';
import 'package:personel_app/core/extension/color.dart';
import 'package:personel_app/core/extension/responsive.dart';
import 'package:personel_app/core/extension/string_constant.dart';
import 'package:personel_app/model/users_data_model.dart';
import 'package:personel_app/views/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class HomeView extends StatefulWidget {
  static String routeName = StringConstants.instance.homeView;
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final formKey = GlobalKey<FormState>();
  TextEditingController expensesController = TextEditingController();
  TextEditingController paymenttypeController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  late UsersData users;
  UserProvider userProvider = UserProvider();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return ChangeNotifierProvider<UserProvider>.value(
      value: userProvider,
      child: Consumer<UserProvider>(
        builder: (context, value, child) => Scaffold(
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
                    child: Form(
                      key: formKey,
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
                              controller: expensesController,
                              radius: 12,
                              height: SizeConfig.screenHeight * .07,
                              hintText: StringConstants.instance.expenses,
                              inputType: TextInputType.name,
                              backroundColor: whiteColor,
                              validator: (value) {
                                if (value!.length < 3) {
                                  return StringConstants
                                      .instance.pleaseEnterValidValue;
                                } else {
                                  return null;
                                }
                              },
                            ),
                            RoundedInputField(
                              height: SizeConfig.screenHeight * .07,
                              controller: paymenttypeController,
                              radius: 12,
                              hintText: StringConstants.instance.payment,
                              inputType: TextInputType.name,
                              backroundColor: whiteColor,
                              validator: (value) {
                                if (value!.length < 3) {
                                  return StringConstants
                                      .instance.pleaseEnterValidValue;
                                } else {
                                  return null;
                                }
                              },
                            ),
                            RoundedInputField(
                              controller: priceController,
                              radius: 12,
                              height: SizeConfig.screenHeight * .07,
                              hintText: StringConstants.instance.price,
                              inputType: TextInputType.number,
                              backroundColor: whiteColor,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return StringConstants
                                      .instance.pleaseEnterValidValue;
                                } else {
                                  return null;
                                }
                              },
                            ),
                            RoundedInputField(
                              icon: Icons.calendar_today,
                              ontap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101));
                                if (pickedDate != null) {
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);
                                  setState(() {
                                    dateController.text = formattedDate;
                                  });
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(StringConstants
                                          .instance.pleaseSelectDate),
                                    ),
                                  );
                                }
                              },
                              controller: dateController,
                              radius: 12,
                              height: SizeConfig.screenHeight * .07,
                              hintText: StringConstants.instance.date,
                              inputType: TextInputType.datetime,
                              backroundColor: whiteColor,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return StringConstants
                                      .instance.pleaseEnterValidValue;
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
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                users = UsersData(
                  expenses: expensesController.text,
                  price: int.parse(priceController.text),
                  paymentType: paymenttypeController.text,
                  date: DateTime.parse(dateController.text),
                );
                value.addData(users);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content:
                        Text(StringConstants.instance.registrationSuccessful),
                  ),
                );
                expensesController.clear();
                paymenttypeController.clear();
                priceController.clear();
                dateController.clear();
              }
            },
            backgroundColor: whiteColor,
            child: const Icon(
              Icons.check,
              color: blackColor,
              size: 25,
            ),
          ),
        ),
      ),
    );
  }
}
