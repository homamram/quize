import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:quize/app/my_app.dart';
import 'package:quize/app/my_app_controller.dart';
import 'package:quize/core/data/repositories/shared_prefreance_repository.dart';
import 'package:quize/core/services/connectivity_service.dart';
import 'package:quize/core/services/location_service.dart';
import 'package:quize/firebase_options.dart';
import 'package:quize/ui/shared/utils.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
//main
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync(
    () async {
      var sharedPref = await SharedPreferences.getInstance();
      return sharedPref;
    },
  );

  Get.put(SharedPrefranceRepository());
 // Get.put(CartService());
  Get.put(LocationService());
  Get.put(ConnectivityService());
  Get.put(MyAppController());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  runApp(MyApp());
}
