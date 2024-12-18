import 'package:account_management_task/services/hive_services/hive_services.dart';
import 'package:get/get.dart';

import '../../../model/user_hive_model.dart';

class UpdateUserScreenController extends GetxController {
  void updateUser(int userIndex, UserHiveModel userModel) async {
    HiveServices.instance.updateHiveUser(userIndex, userModel);
    Get.snackbar('User Update Successful', 'Thank You!');
  }
}
