import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TesterApp extends StatelessWidget {
  final Widget tested;

  const TesterApp({super.key, required this.tested});

  static const String _path = '/tested';

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouter(
          initialLocation: _path,
          routes: [GoRoute(path: _path, builder: (context, state) => tested)]),
    );
  }
}
