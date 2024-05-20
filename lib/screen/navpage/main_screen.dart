import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapi/controller/main_controller.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final controller = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MainController>(
        builder: (controller) {
          return IndexedStack(
            index: controller.currentIndex,
            children: controller.listScreen,
          );
        },
      ),
      bottomNavigationBar: GetBuilder<MainController>(
        builder: (controller) {
          return BottomNavigationBar(
            showSelectedLabels: true,
            showUnselectedLabels: false,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            currentIndex: controller.currentIndex,
            onTap: (index) {
              controller.changeIndex(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shop),
                label: "Shopping",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
              ),
            ],
          );
        },
      ),
    );
  }
}
