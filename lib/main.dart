import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:incubator/utils/themes.dart';

import 'controllers/main_wrapper_controller.dart';
import 'main_wrapper.dart';

void main() {
  runApp(const MyApp());
  // SystemChrome.setPreferredOrientations(
  //   [DeviceOrientation.portraitUp],
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Eggy',
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: Get.put(MainWrapperController()).theme,
      home: MainWrapper(),
    );
  }
}
