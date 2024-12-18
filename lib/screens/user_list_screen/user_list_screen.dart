import 'package:account_management_task/screens/register_user_screen/register_user_screen.dart';
import 'package:account_management_task/screens/update_user_screen/update_user_screen.dart';
import 'package:account_management_task/screens/user_list_screen/controller/user_list_screen_controller.dart';
import 'package:account_management_task/utils/route_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../reusable_widgets/profile_photo_widget.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  UserListScreenController userListScreenController =
      Get.put(UserListScreenController());

  @override
  void initState() {
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
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => context.goto(const RegisterUserScreen()),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() {
              return Column(
                children: [
                  Expanded(
                    child: userListScreenController.registerUserList.isEmpty
                        ? const Center(
                            child: Text('No User Registered'),
                          )
                        : ListView.builder(
                            itemCount: userListScreenController
                                .registerUserList.length,
                            itemBuilder: (context, index) {
                              final user = userListScreenController
                                  .registerUserList[index];

                              return Card(
                                child: ListTile(
                                  isThreeLine: true,
                                  onTap: () {
                                    context.goto(UpdateUserScreen(
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
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    '${user.mobileNo}\n${user.email}\nPassword : ${user.password}',
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  trailing: IconButton(
                                      onPressed: () {
                                        userListScreenController
                                            .deleteUser(user);
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
