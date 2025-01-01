import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailProductController extends GetxController {
  CollectionReference products =
      FirebaseFirestore.instance.collection('products');
  TextEditingController? nameC;
  TextEditingController? priceC;

  Future edit(String doc, String name, String price) {
    return products.doc(doc).update({
      'name': name,
      'price': price,
    }).then(
      (value) {
        Get.back();
        Get.snackbar("Berhasil", "Data berhasil diubah",
            snackPosition: SnackPosition.BOTTOM,
            margin: EdgeInsets.all(10),
            backgroundColor: Colors.green,
            colorText: Colors.white,
            duration: Duration(seconds: 5));
      },
    ).catchError((error) {
      Get.snackbar("Gagal", "Data gagal diubah",
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
