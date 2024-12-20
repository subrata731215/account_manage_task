import 'package:account_management_task/model/user_hive_model.dart';
import 'package:hive_flutter/adapters.dart';

class HiveServices {
  HiveServices._();

  static HiveServices instance = HiveServices._();

  Box<UserHiveModel>? _userBox;

  Future<void> openBox() async {
    _userBox = await Hive.openBox<UserHiveModel>('user');
  }

  Future<void> closeBox() async {
    await _userBox!.close();
  }

  Future<List<UserHiveModel>> getUser() async {
    if (_userBox == null) {
      await openBox();
    }
    return _userBox!.values.toList();
  }

  Future<void> addUser(UserHiveModel userHiveModel) async {
    if (_userBox == null) {
      await openBox();
    }
    await _userBox!.add(userHiveModel);
  }

  Future<void> deleteUserAt(int index) async {
    if (_userBox == null) {
      await openBox();
    }
    await _userBox!.deleteAt(index);
  }

  Future<void> updateHiveUser(int index, UserHiveModel userHiveModel) async {
    if (_userBox == null) {
      await openBox();
    }
    await _userBox!.putAt(index, userHiveModel);
  }
}
