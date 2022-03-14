import 'package:assignment/screens/articleDetails.dart';
import 'package:assignment/screens/homepage.dart';
import 'package:assignment/screens/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'favorites.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController pageController = PageController();
  List<Widget> pages = [Favorites(), HomePage(), Profile()];

  int selectedTab = 1;
  void onPageChanged(int index) {
    setState(() {
      selectedTab = index;
    });

    void onTapItem(int selectedItems) {
      pageController.jumpToPage(selectedItems);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            selectedTab == 0
                ? 'Favorites'
                : selectedTab == 1
                    ? 'Home'
                    : 'Profile',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: selectedTab == 0
              ? Icon(
                  Icons.favorite,
                  color: Colors.black,
                )
              : selectedTab == 1
                  ? Icon(
                      Icons.home,
                      color: Colors.black,
                    )
                  : Icon(Icons.person, color: Colors.black)),
      body: pages[selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
        currentIndex: selectedTab,
        onTap: (int i) {
          setState(() {
            selectedTab = i;
          });
        },
      ),
    );
  }
}
