import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/app/routes/app_pages.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  void login(String email, String password) async {
    try {
      UserCredential myUser = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (myUser.user?.emailVerified == true) {
        Get.snackbar("Berhasil Login", "Selamat datang ${myUser.user?.email}",
            snackPosition: SnackPosition.BOTTOM,
            margin: EdgeInsets.all(10),
            backgroundColor: Colors.green,
            colorText: Colors.white,
            duration: Duration(seconds: 5));
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.snackbar(
            "Verifikasi Email", "Anda harus verifikasi email terlebih dahulu",
            snackPosition: SnackPosition.BOTTOM,
            margin: EdgeInsets.all(10),
            backgroundColor: Colors.red,
            colorText: Colors.white,
            duration: Duration(seconds: 5));
        Get.offAllNamed(Routes.LOGIN);
      }
    } on FirebaseAuthException catch (e) {
      print("yayayayyayayayayayya ${e.code}");
      if (e.code == 'invalid-credential') {
        Get.snackbar(
            "User tidak terdaftar", "Tidak ada user dengan email $email",
            snackPosition: SnackPosition.BOTTOM,
            margin: EdgeInsets.all(10),
            backgroundColor: Colors.red,
            colorText: Colors.white,
            duration: Duration(seconds: 5));
        print("sddsdsd");
      } else if (e.code == 'wrong-password') {
        Get.snackbar("Password Salah", "Password yang anda masukkan salah",
            snackPosition: SnackPosition.BOTTOM,
            margin: EdgeInsets.all(10),
            backgroundColor: Colors.red,
            colorText: Colors.white,
            duration: Duration(seconds: 5));
        print('Wrong password provided for that user.');
      }
    }
  }

  void signUp(String email, String password) async {
    try {
      UserCredential myUser =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (myUser.user?.emailVerified == true) {
        Get.offAllNamed(Routes.HOME);
      } else {
        // Get.snackbar("Verifikasi Email", "Kami telah mengirimkan email verifikasi ke ${myUser.user?.email}",
        //     snackPosition: SnackPosition.BOTTOM,
        //     margin: EdgeInsets.all(10),
        //     backgroundColor: Colors.green,
        //     colorText: Colors.white,
        //     duration: Duration(seconds: 5));
        Get.defaultDialog(
          title: "Verifikasi Email",
          middleText:
              "Kami telah mengirimkan email verifikasi ke ${myUser.user?.email}",
          textConfirm: "OK",
          onConfirm: () {
            Get.back();
            Get.back();
          },
        );
        myUser.user?.sendEmailVerification();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar(
            "Password lemah", "Password yang anda masukkan terlalu lemah",
            snackPosition: SnackPosition.BOTTOM,
            margin: EdgeInsets.all(10),
            backgroundColor: Colors.red,
            colorText: Colors.white,
            duration: Duration(seconds: 5));
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
            "Email sudah terdaftar", "Email yang anda masukkan sudah terdaftar",
            snackPosition: SnackPosition.BOTTOM,
            margin: EdgeInsets.all(10),
            backgroundColor: Colors.red,
            colorText: Colors.white,
            duration: Duration(seconds: 5));
      }
    } catch (e) {
      print(e);
    }
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

  void resetPassword(String email) async {
  
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        Get.back();
        print("hahahah");
        Get.snackbar(
            "Berhasil", "Kami telah mengirimkan reset password ke email $email",
            snackPosition: SnackPosition.BOTTOM,
            margin: EdgeInsets.all(10),
            backgroundColor: Colors.green,
            colorText: Colors.white,
            duration: Duration(seconds: 5));
      } on FirebaseAuthException catch (e) {
        print("kakakakka");
        print(e.code);
        if (e.code == 'user-not-found') {
          Get.snackbar(
            "Terjadi Kesalahan",
            "Email tidak ditemukan. Pastikan email sudah terdaftar.",
            snackPosition: SnackPosition.BOTTOM,
            margin: EdgeInsets.all(10),
            backgroundColor: Colors.red,
            colorText: Colors.white,
            duration: Duration(seconds: 5),
          );
        } 
        if(e.code == "invalid-email") {
          Get.snackbar(
            "Terjadi Kesalahan",
            "Yang anda masukan bukan email",
            snackPosition: SnackPosition.BOTTOM,
            margin: EdgeInsets.all(10),
            backgroundColor: Colors.red,
            colorText: Colors.white,
            duration: Duration(seconds: 5),
          );
        }
        if(e.code == "channel-error") {
          Get.snackbar(
            "Terjadi Kesalahan",
            "Harap masukkan email terlebih dahulu",
            snackPosition: SnackPosition.BOTTOM,
            margin: EdgeInsets.all(10),
            backgroundColor: Colors.red,
            colorText: Colors.white,
            duration: Duration(seconds: 5),
          );
        }
      }
   
  }

  void updateProfile() {}
  void updatePassword() {}
  void deleteAccount() {}
  void verifyEmail() {}
  void reSendEmailVerification() {}
  void signInWithGoogle() {}
}
