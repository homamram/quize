import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quize/core/services/base_controller.dart';

import '../../../../shared/colors.dart';
import '../../../../shared/utils.dart';

class AutoScrollPageViewController extends BaseController {
  final int pageCount = 3;
  var currentPage = 0.obs;
  Timer? timer;

  @override
  void onInit() {
    super.onInit();
    startAutoScroll();
  }

  @override
  void onClose() {
    stopAutoScroll();
    super.onClose();
  }

  void startAutoScroll() {
    timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (currentPage.value < pageCount - 1) {
        currentPage.value++;
      } else {
        currentPage.value = 0;
      }
    });
  }

  void stopAutoScroll() {
    timer?.cancel();
  }
}
