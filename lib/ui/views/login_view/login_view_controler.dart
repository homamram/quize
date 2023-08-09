
import 'package:flutter/material.dart';

import '../../../core/services/base_controller.dart';

class LoginController extends BaseController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  GlobalKey<FormState> loginkey = GlobalKey<FormState>();

  // إضافة المزيد من المتغيرات والمنطق الخاص بصفحة الدخول هنا

  void validateLogin() {
    if (loginkey.currentState!.validate()) {
      // قم بتنفيذ الإجراءات المطلوبة بعد التحقق من صحة البيانات
    }
  }


}