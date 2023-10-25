import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:incubator/view/profile_page.dart';

import '../controllers/main_wrapper_controller.dart';
import 'about_page.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  final MainWrapperController _mainWrapperController =
      Get.find<MainWrapperController>();

  void navigateToAbout() {
    Get.to(() => const AboutPage());
  }

  void navigateToProfile() {
    Get.to(() => const ProfilePage());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _SingleSection(
            title: 'General',
            children: [
              _CustomListTile(
                title: 'About',
                icon: CupertinoIcons.device_phone_portrait,
                onTapCustom: navigateToAbout,
              ),
              _CustomListTile(
                title: 'Dark Mode',
                icon: CupertinoIcons.moon,
                trailing: Obx(() {
                  return CupertinoSwitch(
                    value: _mainWrapperController.isDarkTheme.value,
                    onChanged: (newVal) {
                      _mainWrapperController.isDarkTheme.value = newVal;
                      _mainWrapperController.switchTheme(
                        newVal ? ThemeMode.dark : ThemeMode.light,
                      );
                    },
                  );
                }),
                onTapCustom: () {},
              ),
            ],
          ),
          _SingleSection(
            title: 'Profile',
            children: [
              _CustomListTile(
                title: 'My Profile',
                icon: CupertinoIcons.person,
                onTapCustom: navigateToProfile,
              ),
              _CustomListTile(
                title: 'Logout',
                icon: CupertinoIcons.arrow_right_circle,
                onTapCustom: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget? trailing;
  final VoidCallback onTapCustom;

  const _CustomListTile({
    Key? key,
    required this.title,
    required this.icon,
    this.trailing,
    required this.onTapCustom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 1.0, 1.0, 1.0),
        child: Icon(icon),
      ),
      trailing: trailing ?? const Icon(CupertinoIcons.forward, size: 18),
      onTap: onTapCustom,
    );
  }
}

class _SingleSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _SingleSection({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 1.0, 1.0, 1.0),
            child: Text(
              title.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(fontSize: 16),
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }
}
