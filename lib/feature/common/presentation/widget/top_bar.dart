import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;

  const TopBar({super.key, required this.title, this.actions = const []});

  @override
  Widget build(BuildContext context) => AppBar(
      leading: context.canPop() ? const BackButton() : null,
      title: Text(title),
      actions: actions);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
