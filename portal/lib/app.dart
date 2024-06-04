import 'package:flutter/material.dart';

import 'package:portal/app/login_page.dart';
import 'package:portal/layout/app_layout.dart';
import 'package:portal/shared/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Routes.home: (context) => const AppLayout(),
        Routes.tables: (context) => const AppLayout(),
        Routes.command: (context) => const AppLayout(),
        Routes.products: (context) => const AppLayout(),
        Routes.employees: (context) => const AppLayout(),
        LoginRoutes.login: (context) => const LoginPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
