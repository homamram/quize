
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/data/repositories/user_repository.dart';
import '../../../core/enums/message_type.dart';
import '../../../core/services/base_controller.dart';
import '../../../core/utils/general_utiles.dart';
import '../../shared/custom_widgets/custom_toast.dart';
import '../main_views/main_view/main_view.dart';

class LoginController extends BaseController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  GlobalKey<FormState> loginkey = GlobalKey<FormState>();


  void login() {
    if (loginkey.currentState!.validate()) {
      runFullLoadingFunction(
          function: UserRepository()
              .login(
              user_name: usernameController.text,
              passcode: codeController.text)
              .then((value) {
            value.fold((l) {
              CustomToast.showMeassge(
                  message: l, messageType: MessageType.REJECTED);
            }, (r) {
              storage.setLoggedIN(true);
              storage.setTokenInfo(r);
              Get.off(MainView(), transition: Transition.cupertino);
            });
          }));
    }
  }


}