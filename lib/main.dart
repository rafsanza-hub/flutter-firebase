import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase/app/controllers/auth_controller.dart';
import 'package:flutter_firebase/app/utils/loading.dart';
import 'firebase_options.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  AuthController authC = Get.put(AuthController(), permanent: true);
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: authC.streamAuthStatus,
        builder: (context, snapshot) {
          print(snapshot.data);
          print("yayayayayay");
          if (snapshot.connectionState == ConnectionState.active) {
            return GetMaterialApp(
              title: "Application",
              initialRoute: snapshot.data != null && snapshot.data?.emailVerified != false ? Routes.HOME : Routes.LOGIN,
              getPages: AppPages.routes,
            );
          }
          return LoadingView();
        });
  }
}
