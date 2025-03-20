import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/routes/app_routes.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(AppRoutes.DASHBOARD);
    });

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 74, 129, 76),
      body: Center(
        child: Image.asset('assets/images/logow3.png'),
      ),
    );
  }
}
