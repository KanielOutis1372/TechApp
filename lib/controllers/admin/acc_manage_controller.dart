import 'package:get/get.dart';
import 'package:myapp/models/account.dart';
import 'package:myapp/services/admin/account_service.dart';

class AccManageController extends GetxController {
  var accounts = <Account>[].obs;
  var isLoading = false.obs;

  void FetchAccount() async {
    try {
      isLoading(true);
      final List<Account> accs = await AccountService().fetchUsers();
      accounts.assignAll(accs);
      isLoading(false);
    } catch (e) {
      isLoading(false);
      print(e);
    }
  }

  @override
  void onInit() {
    FetchAccount();
    super.onInit();
  }
}
