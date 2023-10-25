import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/wallet_tab.dart';
import '../view/home_tab.dart';
import '../view/settings_tab.dart';
import '../view/statistics_tab.dart';

class MainWrapperController extends GetxController {
  late PageController pageController;

  RxInt currentPage = 0.obs;
  RxBool isDarkTheme = false.obs;

  List<Widget> pages = [
    const HomeTab(),
    const WalletTab(),
    const StatisticsTab(),
    const SettingsTab(),
  ];

  ThemeMode get theme => Get.isDarkMode ? ThemeMode.dark : ThemeMode.light;

  void switchTheme(ThemeMode mode) {
    Get.changeThemeMode(mode);
  }

  void goToTab(int page) {
    if (page >= 0 && page < pages.length) {
      currentPage.value = page;
      pageController.jumpToPage(page);
    }
  }

  void animateToTab(int page) {
    if (page >= 0 && page < pages.length) {
      currentPage.value = page;
      pageController.animateToPage(page,
          duration: const Duration(milliseconds: 100), curve: Curves.ease);
    }
  }

  @override
  void onInit() {
    pageController = PageController(initialPage: currentPage.value);
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
