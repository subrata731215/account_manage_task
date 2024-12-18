import 'package:account_management_task/services/hive_services/hive_services.dart';
import 'package:get/get.dart';
import '../../../model/user_hive_model.dart';

class UserListScreenController extends GetxController {
  final registerUserList = <UserHiveModel>[].obs;

  Future<void> updateUserList() async {
    registerUserList.value = await HiveServices.instance.getUser();
  }

  void deleteUser(UserHiveModel userModel) async {
    var index = (await HiveServices.instance.getUser()).indexOf(userModel);
    HiveServices.instance.deleteUserAt(index);
    updateUserList();
    Get.snackbar('User Delete Successful', 'Thank You!');
  }
}
