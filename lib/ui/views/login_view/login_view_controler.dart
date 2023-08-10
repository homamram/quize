
import 'package:flutter/material.dart';

import '../../../core/services/base_controller.dart';

class LoginController extends BaseController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  GlobalKey<FormState> loginkey = GlobalKey<FormState>();


  void validateLogin() {
    if (loginkey.currentState!.validate()) {
      //  بتنفيذ الإجراءات المطلوبة بعد التحقق من صحة البيانات
    }
  }


}