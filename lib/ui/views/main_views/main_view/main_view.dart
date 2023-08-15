import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../core/enums/bottom_navigation.dart';
import '../Notification/Notification_View.dart';
import '../Star/Star.dart';
import 'package:get/get.dart';
import '../home_view/home_View.dart';
import '../profile/Profile_view.dart';
import '../main_viewwidget/Buttom_Navigation_Widget.dart';
import 'main_view_controller.dart';

class MainView extends StatelessWidget {
final MainController mainController = Get.put(MainController());

@override
Widget build(BuildContext context) {
  return SafeArea(
    child: Scaffold(
      key:mainController.Scaffoldkey,
      bottomNavigationBar: Obx(
            () => BottomNavigationWidget(
          navitm: mainController.selected.value,
          ontap: (select, pagenumber) {
            mainController.changePage(pagenumber);
            mainController.changeSelected(select);
          },
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: mainController.controller,
        children: [
          NotificationView(),
          HomeView(),
          Star(),
          Profile(),
        ],
      ),
    ),
  );
}
}
