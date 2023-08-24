
import 'package:flutter/cupertino.dart';
import 'package:quize/core/enums/message_type.dart';
import 'package:quize/core/services/base_controller.dart';
import 'package:get/get.dart';
import 'package:quize/core/utils/general_utiles.dart';
import 'package:quize/ui/views/login_view/login_view.dart';
import 'package:quize/ui/views/main_views/main_view/main_view.dart';

import '../../../core/data/repositories/user_repository.dart';
import '../../../core/enums/academic_specialization.dart';
import '../../shared/custom_widgets/custom_toast.dart';
class SignupViewController extends BaseController {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  GlobalKey<FormState> singupkey = GlobalKey<FormState>();
  Rx<AcademicSpecialization?> specialization=
  Rx<AcademicSpecialization?>(AcademicSpecialization.IT);
  @override
  void dispose() {
    nameController.dispose();
    numberController.dispose();
    super.dispose();
  }

  void register() {

    if (singupkey.currentState!.validate()) {
      runFullLoadingFunction(
          function: UserRepository()
              .register(
              user_name:nameController.text,
              phone: numberController.text,
            collage_uuid: '22debb23-9471-4b8c-b489-f0231caa59df'
          )
              .then((value) {
            value.fold((l) {
              CustomToast.showMeassge(
                  message: l, messageType: MessageType.REJECTED);
            }, (r) {
              Get.to(const LoginView(), transition: Transition.cupertino);
            });
          }));
    }
  }
}