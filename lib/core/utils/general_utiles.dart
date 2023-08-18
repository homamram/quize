import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quize/app/my_app_controller.dart';
import 'package:quize/core/data/repositories/shared_prefreance_repository.dart';
import 'package:quize/core/enums/connectivity_status.dart';
import 'package:quize/core/enums/message_type.dart';
import 'package:quize/core/services/cart_service.dart';
import 'package:quize/core/services/connectivity_service.dart';
import 'package:quize/core/services/location_service.dart';
import 'package:quize/core/services/notification_service.dart';
import 'package:quize/ui/shared/colors.dart';
import 'package:quize/ui/shared/custom_widgets/custom_toast.dart';
import 'package:get/get.dart';
SharedPrefranceRepository get storage => Get.find<SharedPrefranceRepository>();

//CartService get cartService => Get.find<CartService>();
ConnectivityService get connectivityService => Get.find<ConnectivityService>();
LocationService get locationService => Get.find<LocationService>();
NotificationService get notificationService => Get.find<NotificationService>();

bool get isOnline =>
    Get.find<MyAppController>().connectionStatus == ConnectivityStatus.ONLINE;

void fadeInTransition(Widget view) {
  Get.to(view, transition: Transition.fadeIn);
}
void checkConnection(Function function) {
  if (isOnline)
    function;
  else
    CustomToast.showMeassge(
        message: 'Please check internet connection',
        messageType: MessageType.WARNING);
}
