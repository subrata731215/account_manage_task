import 'package:account_management_task/screens/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';
import '../reusable_widgets/profile_photo_widget.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  AppController controller = Get.put(AppController());

  @override
  void initState() {
    controller.updateUserList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Registered User',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 2),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: controller.registerUserList.length,
                        itemBuilder: (context, index) {
                          final user = controller.registerUserList[index];

                          return Card(
                            child: ListTile(
                              onTap: () {
                                Get.to(UserProfileScreen(
                                  image: user.image.toString(),
                                  fName: user.firstName,
                                  lName: user.lastName,
                                  mobileNo: user.mobileNo,
                                  email: user.email,
                                  password: user.password,
                                  index: index,
                                ));
                              },
                              leading: ProfilePhotoWidget(
                                  heightWidth: 40, image: user.image),
                              title: Text(
                                '${user.firstName} ${user.lastName}',
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                '${user.mobileNo} & ${user.email}',
                                style: const TextStyle(fontSize: 12),
                              ),
                              trailing: IconButton(
                                  onPressed: () {
                                    controller.deleteUser(user);
                                  },
                                  icon: const Icon(Icons.delete)),
                            ),
                          );
                        }),
                  )
                ],
              );
            })));
  }
}
