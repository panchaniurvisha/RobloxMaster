import 'package:flutter/material.dart';
import 'package:roblox_master/utils/routes/app_routes.dart';
import 'package:roblox_master/utils/routes/routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: "Platypi",
          splashColor: Colors.transparent),
      debugShowCheckedModeBanner: false,
      // home: HomeScreen(),

      routes: appRoutes,
      initialRoute: RoutesName.splashScreen,
    );
  }
}
