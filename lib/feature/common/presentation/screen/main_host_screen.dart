import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainHostScreen extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const MainHostScreen({super.key, required this.navigationShell});

  @override
  State<MainHostScreen> createState() => _MainHostScreenState();
}

class _MainHostScreenState extends State<MainHostScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: widget.navigationShell,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
            widget.navigationShell.goBranch(index,
                initialLocation: index == widget.navigationShell.currentIndex);
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
                  Icons.watch,
                  size: 20,
                )),
          ],
        ),
      );
}
