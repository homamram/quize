
import 'package:quize/core/enums/message_type.dart';

import '../../../../core/data/models/Collages_model.dart';
import '../../../../core/data/repositories/colleges_repository.dart';
import '../../../../core/enums/operation_type.dart';
import '../../../../core/enums/request_status.dart';
import '../../../../core/services/base_controller.dart';
import 'package:get/get.dart';

import '../../../shared/custom_widgets/custom_toast.dart';

class HomePageController extends BaseController {

  RxList<CollagesModel> EngineerCollageslist = <CollagesModel>[].obs;
  RxList<CollagesModel> MedecalCollageslist = <CollagesModel>[].obs;

  bool get ISEngineerCollagesLoading =>
      requestStatus.value == RequestStatus.LOADING &&
          operationType.contains(OperationType.ENGINEER);
  bool get ISMedecalCollagesLoading =>
      requestStatus.value == RequestStatus.LOADING &&
          operationType.contains(OperationType.MEDECAL);




  @override
  void onInit() {
    getAllEngineer();
    getAllMedecal();

    super.onInit();
  }


  void getAllEngineer() {
    runLoadingFutureFunction(
        type: OperationType.ENGINEER,
        function: CollegesRepository().getAll(isenginner: true).then((value) {
          value.fold((l) {
            CustomToast.showMeassge(
                message: l, messageType:MessageType.REJECTED);
          }, (r) {
            EngineerCollageslist.addAll(r);
          });
        }));
  }
  void getAllMedecal() {
    runLoadingFutureFunction(
        type: OperationType.MEDECAL,
        function: CollegesRepository().getAll(isenginner: false).then((value) {
          value.fold((l) {
            CustomToast.showMeassge(
                message: l, messageType:MessageType.REJECTED);
          }, (r) {
            MedecalCollageslist.addAll(r);
          });
        }));
  }


}