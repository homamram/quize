import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../core/enums/bottom_navigation.dart';

class MainController extends GetxController {
  final PageController controller = PageController(initialPage: 1);
  final Rx<BottomNavigationEnum> selected = BottomNavigationEnum.HOME.obs;
  final GlobalKey<ScaffoldState> Scaffoldkey = GlobalKey<ScaffoldState>();


  void changePage(int page) {
    controller.jumpToPage(page);
  }

  void changeSelected(BottomNavigationEnum selection) {
    selected.value = selection;
  }
}