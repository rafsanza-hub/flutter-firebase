import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  TextEditingController? nameC;
  TextEditingController? priceC;
  CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  Future<void> add(String name, String price) {
    var createdAt = DateTime.now().toIso8601String();
    return products.add({
      "name": name,
      "price": price,
      "created_at": createdAt,
    }).then((value) {
      nameC?.clear();
      priceC?.clear();
      Get.back();
      Get.snackbar("Berhasil", "Produk berhasil ditambahkan",
          snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.all(10),
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: Duration(seconds: 5));
    }).catchError((error) {
      print(error);
      Get.snackbar("Gagal", "Produk gagal ditambahkan",
          snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.all(10),
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: Duration(seconds: 5));
    });
  }

  @override
  void onInit() {
    nameC = TextEditingController();
    priceC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameC?.dispose();
    priceC?.dispose();
    super.onClose();
  }
}
