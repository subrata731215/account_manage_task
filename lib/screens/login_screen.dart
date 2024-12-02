import 'package:account_management_task/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../reusable_widgets/app_filled_button.dart';
import '../reusable_widgets/app_textfields.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text(
              'Log In Screen',
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 40),
            AppTextfields(onChanged: (value) {}, hintText: 'Email'),
            const SizedBox(height: 10),
            AppTextfields(onChanged: (value) {}, hintText: 'Password'),
            const SizedBox(height: 10),
            AppFilledButton(
              text: 'LogIn',
              onPressed: () {},
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('You have no account? '),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const RegisterScreen());
                  },
                  child: const Text(
                    'Register ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
