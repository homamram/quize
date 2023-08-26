
import 'package:quize/core/enums/message_type.dart';

import '../../../../core/data/models/Collages_model.dart';
import '../../../../core/data/repositories/colleges_repository.dart';
import '../../../../core/enums/operation_type.dart';
import '../../../../core/enums/request_status.dart';
import '../../../../core/services/base_controller.dart';
import 'package:get/get.dart';

import '../../core/data/models/specilazion_model.dart';
import '../../core/data/repositories/specializations_repository.dart';
import '../shared/custom_widgets/custom_toast.dart';


class SpeclizionController extends BaseController {

  RxList<specializationModel> specialization = <specializationModel>[].obs;

  bool get ISspecializationLoading =>
      requestStatus.value == RequestStatus.LOADING &&
          operationType.contains(OperationType.NONE);





  @override
  void onInit() {
    getAllspecialization();

    super.onInit();
  }


  void getAllspecialization() {
    runLoadingFutureFunction(
        type: OperationType.NONE,
        function: specializationsRepository().getAll().then((value) {
          value.fold((l) {
            CustomToast.showMeassge(
                message: l, messageType:MessageType.REJECTED);
          }, (r) {
            specialization.addAll(r);
          });
        }));
  }


}