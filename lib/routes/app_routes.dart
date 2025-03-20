// ignore_for_file: constant_identifier_names

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:myapp/bindings/admin/category_manage_binding.dart';
import 'package:myapp/bindings/admin/export_admin_bindings.dart';
import 'package:myapp/bindings/admin/order_manage_binding.dart';
import 'package:myapp/bindings/admin/product_cate_binding.dart';
import 'package:myapp/bindings/admin/product_manage_binding.dart';
import 'package:myapp/bindings/client/account_binding.dart';
import 'package:myapp/bindings/client/detail_binding.dart';
import 'package:myapp/bindings/client/export_bindings.dart';
import 'package:myapp/pages/admin/export_admin_page.dart';
import 'package:myapp/pages/admin/order_manage_page.dart';
import 'package:myapp/pages/admin/product_cate_page,.dart';
import 'package:myapp/pages/client/dashboard.dart';
import 'package:myapp/pages/client/search_page.dart';
import 'package:myapp/pages/client/splash.dart';

import '../pages/client/export_pages.dart';

class AppRoutes {
  //client
  static const String SPLASH = '/';
  static const String DASHBOARD = '/dashboard';
  static const String SIGN_UP_PAGE = '/sign-up-page';
  static const String SIGN_IN_PAGE = '/sign-in-page';
  static const String HOME_PAGE = '/home-page';
  static const String CATEGORY_PAGE = '/category-page';
  static const String DETAIL_PAGE = '/detail-page';
  static const String FAVORIT_PAGE = '/favorite-page';
  static const String HISTORY_PAGE = '/history-page';
  static const String ACCOUNT_PAGE = '/account-page';
  static const String CART_PAGE = '/cart-page';
  static const String LIST_PRODUCT_PAGE = '/list-product-page';
  static const String PAYMENT_PAGE = '/payment-page';
  static const String SEARCH_PAGE = '/search-page';
  static const String FAVOR_PAGE = '/favor-page';

  //admin
  static const String DASHBOARD_ADMIN = '/dashboard-admin';
  static const String ORDER_LIST = '/order_list';
  static const String PRODUCT_MANAGE = '/product-manage';
  static const String ADD_UPDATE_PRODUCT = '/add-update-product';
  static const String CATEGORY_MANAGE = '/category-manage';
  static const String ACC_MANAGE = '/acc-manage';
  static const String ORDER_MANAGE = '/order-manage';
  static const String PRODUCT_CATE = '/product-cate';

  static List<GetPage> pages = [
    GetPage(
      name: SPLASH,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: DASHBOARD,
      page: () => const DashBoard(),
      binding: DashBoardBinding(),
    ),
    GetPage(
      name: FAVOR_PAGE,
      page: () => const FavoritePage(),
      binding: DashBoardBinding(),
    ),
    GetPage(
      name: SIGN_UP_PAGE,
      page: () => SignUpPage(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: SIGN_IN_PAGE,
      page: () => SignInPage(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: HOME_PAGE,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: CATEGORY_PAGE,
      page: () => const CategoryPage(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: DETAIL_PAGE,
      page: () => DetailPage(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: FAVORIT_PAGE,
      page: () => const FavoritePage(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: HISTORY_PAGE,
      page: () => const HistoryPage(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: ACCOUNT_PAGE,
      page: () => const AccountPage(),
      binding: AccountBinding(),
    ),
    GetPage(
      name: CART_PAGE,
      page: () => const CartPage(),
      binding: CartBinding(),
    ),
    GetPage(
      name: LIST_PRODUCT_PAGE,
      page: () => ListProductPage(),
      binding: ListProductBinding(),
    ),
    GetPage(
      name: PAYMENT_PAGE,
      page: () => PaymentPage(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: SEARCH_PAGE,
      page: () => MySearchPage(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: DASHBOARD_ADMIN,
      page: () => const DashboardAdminPage(),
      binding: DashboardAdminBinding(),
    ),
    GetPage(
      name: ORDER_LIST,
      page: () => const OrderListPage(),
      binding: OrderListBinding(),
    ),
    GetPage(
      name: PRODUCT_MANAGE,
      page: () => const ProductManagePage(),
      binding: ProductManageBinding(),
    ),
    GetPage(
      name: ADD_UPDATE_PRODUCT,
      page: () => const AddOrUpdateProductPage(),
      binding: AddOrUpdateProductBinding(),
    ),
    GetPage(
      name: CATEGORY_MANAGE,
      page: () => const CategoryManagePage(),
      binding: CategoryManageBinding(),
    ),
    GetPage(
      name: ACC_MANAGE,
      page: () => const AccManagePage(),
      binding: AccManageBinding(),
    ),
    GetPage(
      name: ORDER_MANAGE,
      page: () => const OrderManagePage(),
      binding: OrderManageBinding(),
    ),
    GetPage(
      name: PRODUCT_CATE,
      page: () => const ProductCatePage(),
      binding: ProductCateBinding(),
    ),
  ];
}
