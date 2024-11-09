
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/features/home/presentation/screens/home_screen.dart';
import 'package:todo/features/login/presentation/screens/login_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final rootNavigatorKey = GlobalKey<NavigatorState>();

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: LoginScreen.route,
        name: LoginScreen.name,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: HomeScreen.route,
        name: HomeScreen.name,
        builder: (context, state) => HomeScreen(),
      ),
    ]
  );
});