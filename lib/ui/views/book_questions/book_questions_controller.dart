import 'package:quize/core/services/base_controller.dart';
import 'package:get/get.dart';
import 'package:quize/ui/views/login_view/login_view.dart';
import 'package:quize/ui/views/main_views/home_view/home_View.dart';

import '../../../core/data/models/book_Questions_model.dart';
import '../../../core/data/repositories/book_Question _repository.dart';
import '../../../core/enums/message_type.dart';
import '../../../core/enums/operation_type.dart';
import '../../../core/enums/request_status.dart';
import '../../shared/custom_widgets/custom_toast.dart';
class BookQuestionsController extends BaseController {
  RxList<bookQuestionsModel> bookQuestions = <bookQuestionsModel>[].obs;

  RxDouble progress = 1.0.obs;
  RxInt questionNum = 1.obs;
  RxInt index = 0.obs;
  RxInt selectedIndex = (-1).obs;
  RxList textList = ["1",'2','3','4'].obs;
  RxBool selected = false.obs;
  RxList<List> options =<List>[].obs;

  bool get ISbookQuestionsLoading =>
      requestStatus.value == RequestStatus.LOADING &&
          operationType.contains(OperationType.NONE);
@override
  void onInit() {
  getAllbookQuestions();
    // TODO: implement onInit
    super.onInit();
  }
  void incress(){
  if(index<bookQuestions.length)
  {index++;}

  }

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
  void updateSelectedIndex(int newIndex) {
    selectedIndex.value = newIndex;
  }
  void getAllbookQuestions() {
    runLoadingFutureFunction(
        type: OperationType.NONE,
        function: bookQuestionRepository().getAll().then((value) {
          value.fold((l) {
            CustomToast.showMeassge(
                message: l, messageType:MessageType.REJECTED);
          }, (r) {
            bookQuestions.addAll(r);
            getAllOptions();
          });
        }));
  }
  void pluse(){

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


  getAllOptions(){

  for(var option in bookQuestions){
    options.addAll([option.options!.toJson().values.toList()]);
  }
  }

}