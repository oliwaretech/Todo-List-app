import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/core/providers/router_provider.dart';
import 'package:todo/features/home/presentation/screens/home_screen.dart';
import 'package:todo/features/login/presentation/screens/login_screen.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {

  @override
  void initState() {
    final firebaseAuth = FirebaseAuth.instance;
    super.initState();
    firebaseAuth.authStateChanges().listen((user) {
      final router = ref.read(routerProvider);
      if(user == null) {
        router.goNamed(LoginScreen.name);
      } else {
        router.goNamed(HomeScreen.name);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.linear(1.0),
          ),
          child: child!,
        );
      },
    );
  }
}
