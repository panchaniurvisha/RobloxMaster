import 'package:flutter/material.dart';
import 'package:roblox_master/screen/boys_girls/boys_girls_screen.dart';
import 'package:roblox_master/screen/games/games_information_screen.dart';
import 'package:roblox_master/screen/games/games_screen.dart';
import 'package:roblox_master/screen/games_code/games_code_information_screen.dart';
import 'package:roblox_master/screen/games_code/games_codes_screen.dart';
import 'package:roblox_master/screen/home/home_screen.dart';
import 'package:roblox_master/screen/pets/pet_information_screen.dart';
import 'package:roblox_master/screen/pets/roblox_pet_screen.dart';
import 'package:roblox_master/screen/setting_screen.dart';
import 'package:roblox_master/utils/routes/routes_name.dart';

import '../../screen/splash/splash_screen.dart';

Map<String, WidgetBuilder> appRoutes = {
  RoutesName.splashScreen: (context) => const SplashScreen(),
  RoutesName.homeScreen: (context) => const HomeScreen(),
  RoutesName.boysGirlsScreen: (context) => const BoysGirlsScreen(),
  RoutesName.robLoxPetScreen: (context) => const RobLoxPetScreen(),
  RoutesName.petInformationScreen: (context) => const PetInformationScreen(),
  RoutesName.gamesScreen: (context) => const GamesScreen(),
  RoutesName.gamesInformationScreen: (context) =>
      const GamesInformationScreen(),
  RoutesName.gamesCodeScreen: (context) => const GamesCodeScreen(),
  RoutesName.gamesCodeInformationScreen: (context) =>
      const GamesCodeInformationScreen(),
  RoutesName.settingScreen: (context) => const SettingScreen(),
};
