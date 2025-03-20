import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/pages/client/splash.dart';
import 'package:myapp/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      defaultTransition: Transition.rightToLeftWithFade,
      home: const SplashPage(),
      initialRoute: AppRoutes.SPLASH,
      getPages: AppRoutes.pages,
    );
  }
}
