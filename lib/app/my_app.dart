import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:quize/app/my_app_controller.dart';
import 'package:quize/core/data/repositories/shared_prefreance_repository.dart';
import 'package:quize/core/enums/connectivity_status.dart';
import 'package:quize/core/services/connectivity_service.dart';
import 'package:quize/core/translation/app_translation.dart';
import 'package:quize/ui/shared/utils.dart';
import 'package:quize/ui/specializations_view/specializations_view.dart';
import 'package:quize/ui/views/login_view/login_view.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../core/utils/general_utiles.dart';
import '../ui/views/book_questions/book_questions_view.dart';
import '../ui/views/main_views/main_view/main_view.dart';
import '../ui/views/signup_view./signup_view.dart';
import '../ui/views/main_views/home_view/select_specilazion/select_specilazion.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider(
        create: (context) =>
            connectivityService.connectivityStatusController.stream,
        initialData: ConnectivityStatus.ONLINE,
        child: GetMaterialApp(
            defaultTransition: GetPlatform.isAndroid
                ? Transition.fadeIn
                : Transition.cupertino,
            transitionDuration: Duration(milliseconds: 300),
            translations: AppTranlation(),
            locale: getLocal(),
            fallbackLocale: getLocal(),
            builder: BotToastInit(), //1. call BotToastInit
            navigatorObservers: [BotToastNavigatorObserver()], //2
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            home: BookQuestionsView()));
  }
}

Locale getLocal() {
  if (storage.getAppLanguage() == 'ar') {
    return Locale('ar', 'SA');
  } else {
    return Locale('en', 'US');
  }
}
