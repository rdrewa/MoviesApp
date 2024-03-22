import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/feature/common/presentation/screen/main_host_screen.dart';
import '/feature/details/presentation/screen/details_screen.dart';
import '/feature/home/presentation/screen/home_screen.dart';
import '/feature/now/presentation/screen/now_screen.dart';
import '/feature/watch/presentation/screen/watch_screen.dart';

import 'app_routes.dart';

class AppRouter {
  AppRouter._();

  static const String _homePath = '/home';
  static const String _nowPath = '/now';
  static const String _watchPath = '/watch';
  static const String _detailsPath = 'details/:id';

  static String initial = _homePath;

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorHome = GlobalKey<NavigatorState>();
  static final _shellNavigatorNow = GlobalKey<NavigatorState>();
  static final _shellNavigatorWatch = GlobalKey<NavigatorState>();

  static final routeDetails = GoRoute(
    name: AppRoutes.details,
    path: _detailsPath,
    builder: (context, GoRouterState state) =>
        DetailsScreen(id: int.parse(state.pathParameters['id']!)),
  );

  static final GoRouter config = GoRouter(
      initialLocation: initial,
      navigatorKey: _rootNavigatorKey,
      routes: [
        StatefulShellRoute.indexedStack(
            builder: (context, state, navigationShell) =>
                MainHostScreen(navigationShell: navigationShell),
            branches: [
              StatefulShellBranch(navigatorKey: _shellNavigatorHome, routes: [
                GoRoute(
                    name: AppRoutes.home,
                    path: _homePath,
                    builder: (context, state) => const HomeScreen(),
                    routes: [routeDetails])
              ]),
              StatefulShellBranch(navigatorKey: _shellNavigatorNow, routes: [
                GoRoute(
                    name: AppRoutes.now,
                    path: _nowPath,
                    builder: (context, state) => const NowScreen())
              ]),
              StatefulShellBranch(navigatorKey: _shellNavigatorWatch, routes: [
                GoRoute(
                    name: AppRoutes.watch,
                    path: _watchPath,
                    builder: (context, state) => const WatchScreen())
              ])
            ]),
        // routeDetails
      ]);
}
