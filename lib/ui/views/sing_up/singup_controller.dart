
import 'package:flutter/cupertino.dart';
import 'package:quize/core/services/base_controller.dart';
import 'package:get/get.dart';

import '../../../core/enums/academic_specialization.dart';
class SingupViewController extends BaseController {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  GlobalKey<FormState> singupkey = GlobalKey<FormState>();
  Rx<AcademicSpecialization?> specialization=
  Rx<AcademicSpecialization?>(AcademicSpecialization.IT);
  void validatesignup() {
    if (singupkey.currentState!.validate()) {
      //  بتنفيذ الإجراءات المطلوبة بعد التحقق من صحة البيانات
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    numberController.dispose();
    super.dispose();
  }
}