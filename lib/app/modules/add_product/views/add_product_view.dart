import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_product_controller.dart';

class AddProductView extends GetView<AddProductController> {
  const AddProductView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('AddProductView'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller.nameC,
                decoration: InputDecoration(
                  hintText: "Nama Produk",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller.priceC,
                decoration: InputDecoration(
                  hintText: "Harga Produk",
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                controller.add(controller.nameC!.text, controller.priceC!.text);
              },
              child: Text("Tambah"),
            )
          ],
        ));
  }
}
