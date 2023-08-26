import 'package:quize/core/services/base_controller.dart';
import 'package:get/get.dart';
import 'package:quize/ui/views/login_view/login_view.dart';
class BookQuestionsController extends BaseController {
  RxDouble progress = 1.0.obs;
  RxInt questionNum = 1.obs;
  RxInt selectedIndex = (-1).obs;
  RxList textList = ["1", "2", "2", "3", "5"].obs;
  RxBool selected = false.obs;


  void increaseProgress() {
    if (progress.value < 100) {
      progress.value++;
      questionNum.value++;
    } else {
      Get.to(LoginView());
      // Navigate to LoginView when progress == 100
      // You can handle it in your UI
    }
  }

  void decreaseProgress() {
    if (progress.value > 1) {
      progress.value--;
      questionNum.value--;
    } else {
      Get.to(LoginView());
      // Navigate to LoginView when progress == 0
      // You can handle it in your UI
    }
  }

  void updateSelectedIndex(int index) {
    selectedIndex.value = index;
  }
}