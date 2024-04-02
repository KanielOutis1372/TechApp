// ignore_for_file: constant_identifier_names

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:myapp/bindings/export_bindings.dart';

import '../pages/export_pages.dart';

class AppRoutes {
  static const String SIGN_UP_PAGE = '/sign-up-page';
  static const String SIGN_IN_PAGE = '/sign-in-page';

  static List<GetPage> pages = [
    GetPage(
      name: SIGN_UP_PAGE,
      page: () => SignUpPage(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: SIGN_IN_PAGE,
      page: () => SignInPage(),
      binding: SignInBinding(),
    )
  ];
}
