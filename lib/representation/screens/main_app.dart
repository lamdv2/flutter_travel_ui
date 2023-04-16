import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:travel_app/core/constants/color_constants.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/representation/screens/home_screen.dart';
import 'package:travel_app/representation/screens/likes_screen.dart';

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  static const String routeName = '/main_app';

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          const HomeScreen(),
          const LikesScreen(),
          Container(color: Colors.grey,),
          Container(color: Colors.blue,),
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        selectedItemColor: ColorPalette.primaryColor,
        unselectedItemColor: ColorPalette.primaryColor.withOpacity(0.2),
        items: [
          SalomonBottomBarItem(
            icon: const Icon(FontAwesomeIcons.house, size: kDefaultIconSize,),
            title: const Text('Home')
          ),
          SalomonBottomBarItem(
              icon: const Icon(FontAwesomeIcons.solidHeart, size: kDefaultIconSize,),
              title: const Text('Likes')
          ),
          SalomonBottomBarItem(
              icon: const Icon(FontAwesomeIcons.briefcase, size: kDefaultIconSize,),
              title: const Text('Booking')
          ),
          SalomonBottomBarItem(
              icon: const Icon(FontAwesomeIcons.solidUser, size: kDefaultIconSize,),
              title: const Text('Profile')
          ),
        ],
      ),
    );
  }
}
