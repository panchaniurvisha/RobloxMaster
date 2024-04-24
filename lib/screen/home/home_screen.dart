import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:roblox_master/screen/games/games_screen.dart';
import 'package:roblox_master/screen/pets/roblox_pet_screen.dart';

import '../../res/constant/app_images.dart';
import '../boys_girls/boys_girls_screen.dart';
import '../games_code/games_codes_screen.dart';
import '../setting_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late NotchBottomBarController controller;
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    controller = NotchBottomBarController(index: _currentIndex);
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    controller.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
            controller.index = index;
          });
        },
        children: [
          BoysGirlsScreen(),
          RobLoxPetScreen(),
          GamesScreen(),
          GamesCodeScreen(),
          SettingScreen(),
        ],
      ),
      bottomNavigationBar: AnimatedNotchBottomBar(
          itemLabelStyle: TextStyle(
            color: Colors.grey.withOpacity(0.8),
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
          color: Colors.black,
          notchColor: Colors.black,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              _pageController.animateToPage(
                index,
                duration: Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            });
          },
          // currentIndex: _currentIndex,
          bottomBarItems: [
            BottomBarItem(
              inActiveItem: Image.asset(
                AppImages.tShirtIcon,
                color: Colors.grey.withOpacity(0.8),
              ),
              activeItem: Image.asset(
                AppImages.tShirtIcon,
                color: Colors.white,
              ),
              itemLabel: 'Skins',
            ),
            BottomBarItem(
              inActiveItem: Image.asset(
                AppImages.petsIcon,
                color: Colors.grey.withOpacity(0.8),
              ),
              activeItem: Image.asset(
                AppImages.petsIcon,
                color: Colors.white,
              ),
              itemLabel: 'Pets',
            ),
            BottomBarItem(
              inActiveItem: Image.asset(
                AppImages.gamesIcon,
                color: Colors.grey.withOpacity(0.8),
              ),
              activeItem: Image.asset(
                AppImages.gamesIcon,
                color: Colors.white,
              ),
              itemLabel: 'Games',
            ),
            BottomBarItem(
              inActiveItem: Image.asset(
                AppImages.codeIcon,
                color: Colors.grey.withOpacity(0.8),
              ),
              activeItem: Image.asset(AppImages.codeIcon, color: Colors.white),
              itemLabel: 'Codes',
            ),
            BottomBarItem(
              inActiveItem: Icon(
                Icons.settings,
                color: Colors.grey.withOpacity(0.8),
              ),
              activeItem: Icon(Icons.settings, color: Colors.white),
              itemLabel: 'Settings',
            ),
          ],
          notchBottomBarController: controller,
          kIconSize: 28,
          kBottomRadius: 20),
    );
  }
}
