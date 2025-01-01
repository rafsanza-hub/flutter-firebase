import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Stream<QuerySnapshot<Map<String, dynamic>>> products =
      FirebaseFirestore.instance.collection('products').orderBy("created_at").snapshots();

  Future delete(doc) {
    var docRef = FirebaseFirestore.instance.collection('products').doc(doc);

    return Get.defaultDialog(
      title: "Hapus Data",
      middleText: "Apakah anda yakin ingin menghapus data ini?",
      textConfirm: "Ya",
      textCancel: "Tidak",
      onConfirm: () {
         Get.back();
        docRef.delete().then(
          (value) {
            Get.snackbar("Berhasil", "Data berhasil dihapus",
                snackPosition: SnackPosition.BOTTOM,
                margin: EdgeInsets.all(10),
                backgroundColor: Colors.green,
                colorText: Colors.white,
                duration: Duration(seconds: 5));
          },
        ).catchError((error) {
          Get.snackbar("Gagal", "Data gagal dihapus",
              snackPosition: SnackPosition.BOTTOM,
              margin: EdgeInsets.all(10),
              backgroundColor: Colors.red,
              colorText: Colors.white,
              duration: Duration(seconds: 5));
        });
      },
    );
  }
}
