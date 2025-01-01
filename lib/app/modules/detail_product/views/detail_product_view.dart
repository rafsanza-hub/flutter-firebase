import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_product_controller.dart';

class DetailProductView extends GetView<DetailProductController> {
  const DetailProductView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('DetailProductView'),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: controller.products.doc(Get.arguments).get(),
            builder: (context, snapshot) {
              
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              var data = snapshot.data?.data() as Map<String, dynamic>;

              controller.nameC?.text = data['name'];
              controller.priceC?.text = data['price'].toString();
              return Column(
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
                      controller.edit(Get.arguments, controller.nameC!.text,
                          controller.priceC!.text);
                    },
                    child: Text("Tambah"),
                  )
                ],
              );
            }));
  }
}
