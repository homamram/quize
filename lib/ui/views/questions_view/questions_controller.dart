import 'package:quize/core/services/base_controller.dart';
import 'package:get/get.dart';
import 'package:quize/ui/views/login_view/login_view.dart';

import '../../../core/data/models/apis/questions_model.dart';
import '../../../core/data/models/book_Questions_model.dart';
import '../../../core/data/repositories/book_Question _repository.dart';
import '../../../core/data/repositories/question _repository.dart';
import '../../../core/enums/message_type.dart';
import '../../../core/enums/operation_type.dart';
import '../../../core/enums/request_status.dart';
import '../../shared/custom_widgets/custom_toast.dart';
class QuestionsController extends BaseController {
  RxList<QuestionsModel> Questions = <QuestionsModel>[].obs;
  RxList<List> options =<List>[].obs;
  RxInt index = 0.obs;



  RxDouble progress = 1.0.obs;
  RxInt questionNum = 1.obs;
  RxInt selectedIndex = (-1).obs;
  RxList textList = ["1",'2'].obs;
  RxBool selected = false.obs;

  bool get ISQuestionsLoading =>
      requestStatus.value == RequestStatus.LOADING &&
          operationType.contains(OperationType.NONE);
  @override
  void onInit() {
    getAllQuestions();
    // TODO: implement onInit
    super.onInit();
  }
  void incress(){
    if(index<Questions.length-1)
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
  void getAllQuestions() {
    runLoadingFutureFunction(
        type: OperationType.NONE,
        function: QuestionRepository().getAll().then((value) {
          value.fold((l) {
            CustomToast.showMeassge(
                message: l, messageType:MessageType.REJECTED);
          }, (r) {
            Questions.addAll(r);
            getAllOptions();
          });
        }));
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

    for(var option in Questions){
      options.addAll([option.options!.toJson().values.toList()]);
    }
  }

  void updateSelectedIndex(int index) {
    selectedIndex.value = index;
  }
}