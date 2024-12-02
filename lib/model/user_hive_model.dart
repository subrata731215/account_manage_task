import 'package:hive_flutter/adapters.dart';
part 'user_hive_model.g.dart';

@HiveType(typeId: 0)
class UserHiveModel {
  @HiveField(0)
  String firstName;
  @HiveField(1)
  String lastName;
  @HiveField(2)
  String mobileNo;
  @HiveField(3)
  String email;
  @HiveField(4)
  String password;
  @HiveField(5)
  String? image;

  UserHiveModel(
      {required this.firstName,
      required this.lastName,
      required this.mobileNo,
      required this.password,
      required this.email,
      this.image});
}
