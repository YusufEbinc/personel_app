import 'package:flutter/material.dart';
import 'package:personel_app/core/extension/color.dart';
import 'package:personel_app/core/extension/string_constant.dart';
import 'package:personel_app/views/home/home_view.dart';
import 'package:personel_app/views/home_detail/home_detail_view.dart';
import 'package:personel_app/views/settings/setting_view.dart';

class BottomNavigationView extends StatefulWidget {
  static String routeName = StringConstants.instance.bottomNavigationView;
  const BottomNavigationView({Key? key}) : super(key: key);

  @override
  State<BottomNavigationView> createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomNavigationView> {
  List page = [
    const HomeDetailView(),
    const HomeView(),
    const SettingsView(),
  ];
  int selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: page.elementAt(selectedIndex),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                  icon: Icon(
                    Icons.favorite,
                    size: 25,
                    color: selectedIndex == 0 ? blackColor : greyColor,
                  )),
              IconButton(
                  onPressed: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                  icon: Icon(
                    Icons.home,
                    size: 25,
                    color: selectedIndex == 1 ? blackColor : greyColor,
                  )),
              IconButton(
                  onPressed: () {
                    setState(() {
                      selectedIndex = 2;
                    });
                  },
                  icon: Icon(
                    Icons.settings,
                    size: 25,
                    color: selectedIndex == 2 ? blackColor : greyColor,
                  )),
            ],
          ),
        ));
  }
}
