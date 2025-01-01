import 'package:flutter/material.dart';
import 'package:flutter_firebase/app/controllers/auth_controller.dart';
import 'package:flutter_firebase/app/routes/app_pages.dart';

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
      body: StreamBuilder(
        stream: controller.products,
        builder: (context, snapshot) {
          dynamic data = snapshot.data?.docs;
          print(snapshot.data?.docs);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(data[index]['name']),
              subtitle: Text(data[index]['price'].toString()),
              trailing: IconButton(
                onPressed: () => controller.delete(data[index].id),
                icon: Icon(Icons.delete),
              ),
              onTap: () =>
                  Get.toNamed(Routes.DETAIL_PRODUCT, arguments: data[index].id),
            ),
          );
        },
      ),
      floatingActionButton: IconButton(
        onPressed: () => Get.toNamed(Routes.ADD_PRODUCT),
        icon: Icon(Icons.add),
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.blue),
        ),
      ),
    );
  }
}
