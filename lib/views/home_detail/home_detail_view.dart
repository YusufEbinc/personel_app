import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personel_app/core/extension/color.dart';
import 'package:personel_app/core/extension/string_constant.dart';

import 'package:personel_app/views/user_provider.dart';
import 'package:provider/provider.dart';

class HomeDetailView extends StatefulWidget {
  const HomeDetailView({Key? key}) : super(key: key);

  @override
  State<HomeDetailView> createState() => _HomeDetailViewState();
}

class _HomeDetailViewState extends State<HomeDetailView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
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
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(13)),
                    child: Column(
                      children: [
                        Text(provider.list[index].price.toString()),
                        Text(provider.list[index].expenses.toString()),
                        Text(provider.list[index].paymentType.toString()),
                        Text(DateFormat('yyyy-MM-dd')
                            .format(provider.list[index].date!)),
                      ],
                    )),
              );
            },
          )),
    );
  }

  _showDialog(UserProvider provider) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            actions: [
              Column(
                children: [
                  ListTile(
                    title: Text(
                      'Time',
                      style: Theme.of(context).textTheme.bodyText1,
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
                    title: Text(
                      'Lowest',
                      style: Theme.of(context).textTheme.bodyText1,
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
                    title: Text(
                      'Highest',
                      style: Theme.of(context).textTheme.bodyText1,
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
