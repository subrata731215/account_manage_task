import 'package:get/get.dart';

import '../../../hive_services/hive_services.dart';
import '../../../model/user_hive_model.dart';

class UpdateUserScreenController extends GetxController {
  void updateUser(int userIndex, UserHiveModel userModel) async {
    HiveServices().updateHiveUser(userIndex, userModel);
    Get.snackbar('User Update Successful', 'Thank You!');
  }
}
