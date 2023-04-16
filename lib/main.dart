import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:travel_app/core/constants/color_constants.dart';
import 'package:travel_app/core/helpers/local_storage_helper.dart';
import 'package:travel_app/representation/screens/splash.dart';
import 'package:travel_app/routes.dart';

void main() async{
  await Hive.initFlutter();
  await LocalStorageHelper.initLocalStorageHelper();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      theme: ThemeData(
        primaryColor: ColorPalette.primaryColor,
        scaffoldBackgroundColor: ColorPalette.backgroundScaffoldColor,
        backgroundColor: ColorPalette.backgroundScaffoldColor,
      ),
      routes: routes,
      onGenerateRoute: generateRoutes,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen()
    );
  }
}

