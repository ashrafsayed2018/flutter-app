import 'package:flutter/material.dart';
import 'package:forsale/application/storage/localstorage.dart';
import 'package:forsale/screens/apportunities/apportunity_screen.dart';
import 'package:forsale/screens/auth/account_page.dart';
import 'package:forsale/screens/favorities_page.dart';
import 'package:forsale/screens/question_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _onItemTapped(int index) {
    _pageController.jumpToPage(index);
  }

  var _currentIndex = 0;

  void _onPageChanged(int pageIndex) {
    setState(() {
      _currentIndex = pageIndex;
    });
  }

  final PageController _pageController = PageController();
  final List<Widget> _screens = const [
    ApportunitiesScreen(),
    QuestionPage(),
    FavoritePage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    // print(LocalStorage.getItem('token'));
    return Scaffold(
      body: PageView(
        children: _screens,
        controller: _pageController,
        onPageChanged: _onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: const IconThemeData(color: Colors.blueAccent),
        unselectedIconTheme: const IconThemeData(color: Colors.black45),
        elevation: 20,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            label: 'الرئيسيه',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'الدردشه',
            icon: Icon(Icons.chat),
          ),
          BottomNavigationBarItem(
            label: 'المفضله',
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label: 'حسابي',
            icon: Icon(Icons.person),
          )
        ],
      ),
    );
  }
}
