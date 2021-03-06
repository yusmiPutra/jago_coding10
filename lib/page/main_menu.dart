// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pos_apps/page/history_order.dart';
import 'package:pos_apps/page/home_page.dart';
import 'package:pos_apps/page/page_user.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int seletecTab = 0;

  void changeSelectTab(int index) {
    setState(() {
      seletecTab = index;
    });
  }

  var pageOption = [];

  @override
  void initState() {
    pageOption = [HomePage(), HistoryOrder(), PageUser()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageOption[seletecTab],
      bottomNavigationBar: BottomNavigationBar(
        onTap: changeSelectTab,
        currentIndex: seletecTab,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark, size: 30), label: 'History'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 30), label: 'Profile')
        ],
      ),
    );
  }
}
