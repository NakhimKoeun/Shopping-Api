import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shopapi/screen/navpage/cart_screen.dart';
import 'package:shopapi/screen/home_screen.dart';
import 'package:shopapi/screen/navpage/profile_screen.dart';

class MainController extends GetxController {
  int currentIndex = 0;
  final List<Widget> listScreen = [
    HomeScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    update();
  }
}
