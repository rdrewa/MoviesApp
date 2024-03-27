import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/app_routes.dart';

class MainHostScreen extends StatefulWidget {
  final Widget child;

  const MainHostScreen({super.key, required this.child});

  @override
  State<MainHostScreen> createState() => _MainHostScreenState();
}

class _MainHostScreenState extends State<MainHostScreen> {
  int selectedIndex = 0;

  final routes = [
    AppRoutes.home,
    AppRoutes.now,
    AppRoutes.watch
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: widget.child,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
            context.goNamed(routes[index]);
          },
          items: [
            BottomNavigationBarItem(
                label: 'navigation.home'.tr(),
                icon: const Icon(
                  Icons.home,
                  size: 20,
                )),
            BottomNavigationBarItem(
                label: 'navigation.now'.tr(),
                icon: const Icon(
                  Icons.theaters,
                  size: 20,
                )),
            BottomNavigationBarItem(
                label: 'navigation.watch'.tr(),
                icon: const Icon(
                  Icons.remove_red_eye,
                  size: 20,
                )),
          ],
        ),
      );
}
