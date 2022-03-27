import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personel_app/core/extension/color.dart';
import 'package:personel_app/core/extension/string_constant.dart';
import 'package:personel_app/views/user_provider.dart';
import 'package:provider/provider.dart';

class HomeDetailView extends StatelessWidget {
  static String routeName = StringConstants.instance.homeDetailView;
  const HomeDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = UserProvider();
    return ChangeNotifierProvider<UserProvider>.value(
      value: userProvider,
      child: Consumer<UserProvider>(
        builder: (context, provider, child) => Scaffold(
          appBar: AppBar(
            title: Text(StringConstants.instance.homeDetail),
            actions: [
              IconButton(
                  onPressed: () {
                    _showDialog(provider, context);
                  },
                  icon: const Icon(Icons.expand_more))
            ],
          ),
          body: ListView.builder(
            itemCount: provider.list.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(13)),
                  child: ListTile(
                    leading: CircleAvatar(
                        backgroundColor: scafoldbackclr,
                        child: Text(
                          (index + 1).toString(),
                          style: const TextStyle(color: whiteColor),
                        )),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            ' Price: ' + provider.list[index].price.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            ' Expenses: ' +
                                provider.list[index].expenses.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            ' Payment : ' +
                                provider.list[index].paymentType.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            ' Price: ' +
                                DateFormat('yyyy-MM-dd')
                                    .format(provider.list[index].date!),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  _showDialog(UserProvider provider, BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            actions: [
              Column(
                children: [
                  ListTile(
                    title: const Text(
                      'Time',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: Radio<int?>(
                      value: 1,
                      groupValue: provider.selectIndex,
                      onChanged: (int? value) {
                        provider.radioButtonOntap(value, context);
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      'Lowest',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: Radio<int?>(
                      value: 2,
                      groupValue: provider.selectIndex,
                      onChanged: (int? value) {
                        provider.radioButtonOntap(value, context);
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      'Highest',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: Radio<int?>(
                      value: 3,
                      groupValue: provider.selectIndex,
                      onChanged: (int? value) {
                        provider.radioButtonOntap(value, context);
                      },
                    ),
                  ),
                ],
              )
            ],
          );
        });
  }
}





















/*


ChangeNotifierProvider<UserProvider>.value(
       
      value: userProvider,
      child: Consumer<UserProvider>(
        builder: (context, provider, child) => Scaffold(
            appBar: AppBar(
              title: Text(StringConstants.instance.homeDetail),
              actions: [
                IconButton(
                    onPressed: () {
                      _showDialog(provider);
                    },
                    icon: const Icon(Icons.expand_more))
              ],
            ),
            body: ListView.builder(
              itemCount: provider.list.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(13)),
                    child: ListTile(
                      leading: CircleAvatar(
                          backgroundColor: scafoldbackclr,
                          child: Text(
                            (index + 1).toString(),
                            style: const TextStyle(color: whiteColor),
                          )),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              ' Price: ' +
                                  provider.list[index].price.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              ' Expenses: ' +
                                  provider.list[index].expenses.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              ' Payment : ' +
                                  provider.list[index].paymentType.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              ' Price: ' +
                                  DateFormat('yyyy-MM-dd')
                                      .format(provider.list[index].date!),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            ),
      ),
    );*/
  

