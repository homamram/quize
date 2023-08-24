
import 'package:quize/core/enums/message_type.dart';

import '../../../../core/data/models/engineer_Collages_model.dart';
import '../../../../core/data/repositories/engineer_colleges_repository.dart';
import '../../../../core/enums/operation_type.dart';
import '../../../../core/enums/request_status.dart';
import '../../../../core/services/base_controller.dart';
import 'package:get/get.dart';

import '../../../shared/custom_widgets/custom_toast.dart';

class HomePageController extends BaseController {

  RxList<EngineerCollagesModel> EngineerCollageslist = <EngineerCollagesModel>[].obs;

  bool get ISEngineerCollagesLoading =>
      requestStatus.value == RequestStatus.LOADING &&
          operationType.contains(OperationType.ENGINEER);




  @override
  void onInit() {
    getAllEngineer();

    super.onInit();
  }


  void getAllEngineer() {
    runLoadingFutureFunction(
        type: OperationType.ENGINEER,
        function: EngineerCollegesRepository().getAll().then((value) {
          value.fold((l) {
            CustomToast.showMeassge(
                message: l, messageType:MessageType.REJECTED);
          }, (r) {
            EngineerCollageslist.addAll(r);
          });
        }));
  }


}