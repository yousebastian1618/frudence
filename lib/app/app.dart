import 'package:flutter/material.dart';
import 'package:frudence/app/router/app_router.dart';
import 'package:frudence/app/theme/app_theme.dart';

class FrudenceApp extends StatelessWidget {
  const FrudenceApp({ super.key });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Frudence',
      debugShowCheckedModeBanner: false,

      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      routerConfig: AppRouter.router
    );
  }
}