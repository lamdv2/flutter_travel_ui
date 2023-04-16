import 'package:flutter/material.dart';
import 'package:travel_app/data/models/hotel_model.dart';
import 'package:travel_app/representation/screens/add_guest_and_room_screen.dart';
import 'package:travel_app/representation/screens/checkout_screen.dart';
import 'package:travel_app/representation/screens/detail_hotel_screen.dart';
import 'package:travel_app/representation/screens/hotel_booking_screen.dart';
import 'package:travel_app/representation/screens/hotel_screen.dart';
import 'package:travel_app/representation/screens/intro_screen.dart';
import 'package:travel_app/representation/screens/main_app.dart';
import 'package:travel_app/representation/screens/select_date_screen.dart';
import 'package:travel_app/representation/screens/select_room_screen.dart';
import 'package:travel_app/representation/screens/setting_screen.dart';
import 'package:travel_app/representation/screens/splash.dart';
import 'package:travel_app/representation/widgets/google_map_widget.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  IntroScreen.routeName: (context) => const IntroScreen(),
  MainApp.routeName: (context) => const MainApp(),
  HotelScreen.routeName: (context) => const HotelScreen(),
  HotelBookingScreen.routeName: (context) => const HotelBookingScreen(),
  SelectDateScreen.routeName: (context) => SelectDateScreen(),
  AddGuestAndRoomScreen.routeName: (context) => const AddGuestAndRoomScreen(),
  SettingScreen.routeName: (context) => const SettingScreen(),
  GoogleMapWidget.routeName: (context) => const GoogleMapWidget(),
  SelectRoomScreen.routeName: (context) => const SelectRoomScreen(),
  CheckOutScreen.routeName: (context) => const CheckOutScreen(),

};

MaterialPageRoute<dynamic>? generateRoutes(RouteSettings settings){
  switch(settings.name){
    case DetailHotelScreen.routeName:
      return MaterialPageRoute(builder: (context){
        final HotelModel hotelModel = (settings.arguments as HotelModel);
        return DetailHotelScreen(
          hotelModel: hotelModel,
        );
      });
  }
  return null;
}

