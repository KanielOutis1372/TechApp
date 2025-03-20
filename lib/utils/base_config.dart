// ignore_for_file: constant_identifier_names

class BaseConfig {
  // connect by wifi
  static const BASE_URL_W = 'http://';

  //connect by cab:
  //local: http://172.17.16.1:8081
  //online: https://techappbe.000webhostapp.com

  static const BASE_URL_E = 'http://172.16.0.110:80';

  // static const BASE_URL_E = 'https://techappbe.000webhostapp.com';

  //define api
  static const GET_ALL_CATEGORY =
      '$BASE_URL_E/techapp/Api/Category/get_all_category.php';

  static const GET_ALL_PRODUCT =
      '$BASE_URL_E/techapp/Api/Product/get_all_product.php';

  static const GET_ALL_PRODUCT_BY_CATE_ID =
      '$BASE_URL_E/techapp/Api/Product/get_all_product_by_cate_id.php';

  static const SIGN_UP = '$BASE_URL_E/techapp/Api/Auth/signup.php';

  static const SIGN_IN = '$BASE_URL_E/techapp/Api/Auth/login.php';

  static const ORDER = '$BASE_URL_E/techapp/Api/Order/order.php';

  static const GET_ORDERS_BY_USERID =
      '$BASE_URL_E/techapp/Api/Order/get_order_by_userid.php';

  static const DASHBOARD_ADMIN =
      '$BASE_URL_E/techapp/Api/Dashboard/dashboard.php';

  static const ORDER_COUNTER =
      '$BASE_URL_E/techapp/Api/Order/order_counter.php';

  static const ORDER_LIST =
      '$BASE_URL_E/techapp/Api/Order/get_order_by_status.php';

  static const APPROVE_ORDER =
      '$BASE_URL_E/techapp/Api/Order/approve_order.php';

  static const DELETE_ORDER = '$BASE_URL_E/techapp/Api/Order/delete_order.php';

  static const DELETE_PRODUCT =
      '$BASE_URL_E/techapp/Api/Product/delete_product_by_id.php';

  static const SEARCH_PRODUCT =
      '$BASE_URL_E/techapp/Api/Product/search_product.php';

  static const ADD_PRODUCT = '$BASE_URL_E/techapp/Api/Product/add_product.php';

  static const UPLOAD_IMAGES = '$BASE_URL_E/techapp/Api/Image/upload.php';

  static const GET_PRODUCT =
      '$BASE_URL_E/techapp/Api/Product/get_product_by_id.php';

  static const UPDATE_CATEGORY =
      '$BASE_URL_E/techapp/Api/Category/update_category.php';

  static const DELETE_CATEGORY =
      '$BASE_URL_E/techapp/Api/Category/delete_category.php';

  static const ADD_CATEGORY =
      '$BASE_URL_E/techapp/Api/Category/add_category.php';

  static const GET_ALL_ACC = '$BASE_URL_E/techapp/Api/Account/get_all_acc.php';
}
