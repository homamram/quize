import 'package:quize/core/enums/connectivity_status.dart';
import 'package:quize/core/services/base_controller.dart';
import 'package:quize/core/services/connectivity_service.dart';
import 'package:quize/ui/shared/utils.dart';
import 'package:get/get.dart';
import '../core/utils/general_utiles.dart';

class MyAppController extends BaseController {
     ConnectivityStatus connectionStatus = ConnectivityStatus.ONLINE;
   RxBool isOnLine=true.obs;
  @override
  void onInit() {
    // checkConnection();
    super.onInit();
  }
     set setConnectivityStatus(ConnectivityStatus value) {
       connectionStatus = value;
     }

   void listenToConnectionStatus() {
    connectivityService.connectivityStatusController.stream.listen((event) {
      setConnectivityStatus = event;
    });

  }
   void checkConnection() {
     connectivityService.connectivityStatusController.stream.listen((event) {
       listenToConnectionStatus();
       // setIsOnline = event;
       connectionStatus=event;
       print("Connection From HomeViewController Changed To $event");
       isOnLine.value = event == ConnectivityStatus.ONLINE;
     });
   }
}
