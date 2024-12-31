import 'package:flutter/material.dart';
import 'package:flutter_firebase/app/controllers/auth_controller.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final AuthController auth = Get.find<AuthController>();
  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () => auth.signOut(), icon: Icon(Icons.logout))
        ],
      ),
      body: const Center(
        child: Text(
          'HomeView s',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
