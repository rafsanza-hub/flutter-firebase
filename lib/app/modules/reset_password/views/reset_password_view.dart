import 'package:flutter/material.dart';
import 'package:flutter_firebase/app/controllers/auth_controller.dart';
import 'package:flutter_firebase/app/modules/reset_password/controllers/reset_password_controller.dart';

import 'package:get/get.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  final AuthController authC = Get.find<AuthController>();
  final emailC = TextEditingController(text: "rapsanza@gmail.com");
  ResetPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ganti Password'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            TextField(
              controller: emailC,
              decoration: const InputDecoration(
                  labelText: 'Email', border: OutlineInputBorder()),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => authC.resetPassword(emailC.text),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.blue),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              child: const Text("Ganti"),
            ),
          ],
        ),
      ),
    );
  }
}
