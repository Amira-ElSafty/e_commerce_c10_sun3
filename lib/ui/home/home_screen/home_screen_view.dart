import 'package:flutter/material.dart';

import '../tabs/favorite_tab/favorite_tab.dart';
import '../tabs/home_tab/home_tab.dart';
import '../tabs/product_list_tab/product_list_tab.dart';
import '../tabs/profile_tab/profile_tab.dart';
import 'widget/custom_bottom_navigation_bar.dart';


class HomeScreenView extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  int selectedIndex = 0;

  List<Widget> tabs = [
    HomeTab(),
    ProductListTab(),
    FavoriteTab(),
    ProfileTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildCustomBottomNavigationBar(
        context: context,
        selectedIndex: selectedIndex,
        onTapFunction: (index) {
          selectedIndex = index;
          setState(() {

          });
        },
      ),
      body: tabs[selectedIndex],
    );
  }
}
